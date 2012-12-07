package com.tanghsk.sync.remote;

import java.rmi.RemoteException;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.naming.InitialContext;

import org.apache.log4j.Logger;

import com.tanghsk.sync.util.RSAEncryption;

public class CryptRemoteImpl implements CryptRemote {
	protected Logger logger = Logger.getLogger(CryptRemoteImpl.class);

	@Override
	public String encrypt(String source) throws RemoteException {
		// TODO Auto-generated method stub
		String s = "";
		try {
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
			byte[] plainText = source.getBytes();
			// ����
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			byte[] enBytes = cipher.doFinal(plainText);
			logger.info("���ܺ����ݣ�" + enBytes.toString());
			s = enBytes.toString();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public String decrypt(String source) throws RemoteException {
		// TODO Auto-generated method stub
		String s = "";
		try {
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
			byte[] enBytes = source.getBytes();
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
			s = new String(deBytes);
			logger.info("���ܺ�����:" + s);
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public static void main(String[] args) {
		try {
			CryptRemoteImpl cal = new CryptRemoteImpl();
			javax.naming.Context context = new InitialContext();
			context.bind("rmi://localhost:8080/CalculatorService", cal);
			System.out.println("server started...");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
