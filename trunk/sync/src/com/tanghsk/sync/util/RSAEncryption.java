package com.tanghsk.sync.util;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

import org.apache.log4j.Logger;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class RSAEncryption {
	protected Logger logger = Logger.getLogger(RSAEncryption.class);
	/**
	 * �õ���Կ
	 * 
	 * @param key
	 *            ��Կ�ַ���������base64���룩
	 * @throws Exception
	 */
	public static PublicKey getPublicKey(String key) throws Exception {
		byte[] keyBytes;
		keyBytes = (new BASE64Decoder()).decodeBuffer(key);

		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyFactory.generatePublic(keySpec);
		return publicKey;
	}

	/**
	 * �õ�˽Կ
	 * 
	 * @param key
	 *            ��Կ�ַ���������base64���룩
	 * @throws Exception
	 */
	public static PrivateKey getPrivateKey(String key) throws Exception {
		byte[] keyBytes;
		keyBytes = (new BASE64Decoder()).decodeBuffer(key);

		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
		return privateKey;
	}

	/**
	 * �õ���Կ�ַ���������base64���룩
	 * 
	 * @return
	 */
	public static String getKeyString(Key key) throws Exception {
		byte[] keyBytes = key.getEncoded();
		String s = (new BASE64Encoder()).encode(keyBytes);
		return s;
	}

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
		// ��Կλ��
		keyPairGen.initialize(1024);
		// ��Կ��
		KeyPair keyPair = keyPairGen.generateKeyPair();

		// ��Կ
		PublicKey publicKey = (RSAPublicKey) keyPair.getPublic();

		// ˽Կ
		PrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();

		String publicKeyString = getKeyString(publicKey);
		System.out.println("public:\n" + publicKeyString);

		String privateKeyString = getKeyString(privateKey);
		System.out.println("private:\n" + privateKeyString);

		// �ӽ�����
		Cipher cipher = Cipher.getInstance("RSA");// Cipher.getInstance("RSA/ECB/PKCS1Padding");

		// ����
		byte[] plainText = "tangce123admin".getBytes();

		// ����
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] enBytes = cipher.doFinal(plainText);
		System.out.println("���ܺ�����ݣ�"+enBytes.toString());

		// ͨ����Կ�ַ����õ���Կ
		publicKey = getPublicKey(publicKeyString);
		privateKey = getPrivateKey(privateKeyString);

		// ����
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] deBytes = cipher.doFinal(enBytes);

		publicKeyString = getKeyString(publicKey);
		System.out.println("public:\n" + publicKeyString);

		privateKeyString = getKeyString(privateKey);
		System.out.println("private:\n" + privateKeyString);

		String s = new String(deBytes);
		System.out.println("���ܺ�����ݣ�"+s);

	}

}
