package com.tanghsk.sync.action.base;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import javax.crypto.Cipher;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanghsk.sync.util.RSAEncryption;

@Controller
@RequestMapping("/base/**")
public class BaseAction {
	protected static Logger logger = Logger.getLogger(BaseAction.class);
	/**
	 * ����
	 * 
	 * @param str
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "encrypt_str/{pass}", method = {RequestMethod.POST,RequestMethod.GET})
	public String encrypt(@PathVariable(value = "pass") String str, Model model) throws Exception {

		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
		// ��Կλ��
		keyPairGen.initialize(1024);
		// ��Կ��
		KeyPair keyPair = keyPairGen.generateKeyPair();

		// ��Կ
		PublicKey publicKey = (RSAPublicKey) keyPair.getPublic();

		// ˽Կ
		PrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();

		String publicKeyString = RSAEncryption.getKeyString(publicKey);
		logger.info("public:\n" + publicKeyString);

		String privateKeyString = RSAEncryption.getKeyString(privateKey);
		logger.info("private:\n" + privateKeyString);

		// �ӽ�����
		Cipher cipher = Cipher.getInstance("RSA");// Cipher.getInstance("RSA/ECB/PKCS1Padding");

		// ����
		// byte[] plainText = "���Ƕ��ܺã��ʼ���@sina.com".getBytes();
		byte[] plainText = str.getBytes();

		// ����
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] enBytes = cipher.doFinal(plainText);
		logger.info("���ܺ����ݣ�"+enBytes.toString());
		return enBytes.toString();
		// return null;
	}

	@RequestMapping(value = "decrypt_str/{pass}", method = {RequestMethod.POST,RequestMethod.GET})
	public String decrypt(@PathVariable(value = "pass") String str, Model model) throws Exception {

		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
		// ��Կλ��
		keyPairGen.initialize(1024);
		// ��Կ��
		KeyPair keyPair = keyPairGen.generateKeyPair();

		// ��Կ
		PublicKey publicKey = (RSAPublicKey) keyPair.getPublic();

		// ˽Կ
		PrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();

		String publicKeyString = RSAEncryption.getKeyString(publicKey);
		// System.out.println("public:\n" + publicKeyString);

		String privateKeyString = RSAEncryption.getKeyString(privateKey);
		// System.out.println("private:\n" + privateKeyString);

		// �ӽ�����
		Cipher cipher = Cipher.getInstance("RSA");// Cipher.getInstance("RSA/ECB/PKCS1Padding");

		byte[] enBytes = str.getBytes();

		// ͨ����Կ�ַ�õ���Կ
		publicKey = RSAEncryption.getPublicKey(publicKeyString);
		privateKey = RSAEncryption.getPrivateKey(privateKeyString);

		// ����
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] deBytes = cipher.doFinal(enBytes);

		publicKeyString = RSAEncryption.getKeyString(publicKey);
		logger.info("public:\n" + publicKeyString);

		privateKeyString = RSAEncryption.getKeyString(privateKey);
		logger.info("private:\n" + privateKeyString);

		String s = new String(deBytes);
		logger.info("���ܺ�����:"+s);
		return s;
	}

}
