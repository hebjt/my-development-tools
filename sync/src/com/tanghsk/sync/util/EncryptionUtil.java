package com.tanghsk.sync.util;

import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.cert.X509Certificate;
import org.w3c.dom.Element;

public class EncryptionUtil {
	// 基于xml元素的加密和解密 加密函数

	public static org.w3c.dom.Element EncryptElement(final String strTagNameOfElementToEncrypt, final org.w3c.dom.Element elemParent) throws Exception {
		org.apache.xml.security.Init.init();

		String strEncryptionAlgorithm = org.apache.xml.security.encryption.XMLCipher.AES_128;

		String strEncryptionAlgorithmProvider = null;

		String strEncryptionDigestAlgorithm = org.apache.xml.security.utils.Constants.ALGO_ID_DIGEST_SHA1;

		String strEncryptionKeyGeneratorAlgorithm = "AES";

		String strEncryptionKeyGeneratorAlgorithmProvider = null;

		int nEncryptionKeyGeneratorSize = 128;

		String strEncryptionKeyWrapAlgorithm = org.apache.xml.security.encryption.XMLCipher.RSA_OAEP;

		String strEncryptionKeyWrapAlgorithmProvider = null;

		final org.w3c.dom.Element domParent = elemParent;
		final org.w3c.dom.Document domDocument = domParent.getOwnerDocument();
		final org.w3c.dom.NodeList nlToEncrypts = domParent.getElementsByTagName(strTagNameOfElementToEncrypt);
		if (null == nlToEncrypts) {
			final String strErrorMessage = "org.w3c.dom.Element.getElementsByTagNameNS unexpectedly returned null";
			// XMLSecurityApacheExtension.log.error(strErrorMessage);
			return null;
		}

		if (1 != nlToEncrypts.getLength()) {
			final String strErrorMessage = "org.w3c.dom.Element.getElementsByTagNameNS unexpectedly returned " + nlToEncrypts.getLength() + " nodes";
			// XMLSecurityApacheExtension.log.error(strErrorMessage);
			return null;
		}
		final org.w3c.dom.Element domToEncrypt = (org.w3c.dom.Element) nlToEncrypts.item(0);
		final org.w3c.dom.Element domTempParent = domDocument.createElement("Parent");
		final org.w3c.dom.Element domTempToEncrypt = (org.w3c.dom.Element) domTempParent.appendChild(domToEncrypt.cloneNode(true));

		String pass = "123456";
		FileInputStream in = new FileInputStream("C:\\Users\\mina\\tomcat.keystore");
		KeyStore ks = KeyStore.getInstance("JKS");
		ks.load(in, pass.toCharArray());
		java.security.cert.Certificate cert = ks.getCertificate("tomcat");

		final X509Certificate certificate = (X509Certificate) cert;
		// final String certificate =
		// "MIIEsjCCApoCAQAwDQYJKoZIhvcNAQEEBQAwga8xCzAJBgNVBAYTAkNIMQ8wDQYDVQQIEwZadXJpY2gxDzANBgNVBAcTBlp1cmljaDEhMB8GA1UEChMYQWJoaUNlcnRpZmljYXRlQXV0aG9yaXR5MRUwEwYDVQQLEwxGaXJzdFR5cGUgQ0ExITAfBgNVBAMTGEFiaGlDZXJ0aWZpY2F0ZUF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYSYWJzQHp1cmljaC5pYm0uY29tMB4XDTA3MDUwNzEzMDAwNloXDTA3MDgxNTEzMDAwNlowgY0xCzAJBgNVBAYTAkNIMQ8wDQYDVQQIEwZadXJpY2gxDzANBgNVBAcTBlp1cmljaDEQMA4GA1UEChMHSUJNIFpSTDESMBAGA1UECxMJYWJoaSB0ZXN0MRMwEQYDVQQDEwphYmhpbGFwdG9wMSEwHwYJKoZIhvcNAQkBFhJhYmhpQGNzYWlsLm1pdC5lZHUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCskkmbBSXMRT9FuoE+hn0XvSKCJhedXG6ktgnjqODbDXlWHqDW+Jxj/N7CD1Nxry0lIsKNVcgJ8QXpX21aTDH3lMgdAZVyQYkVA24fGolV6fRFSybwaZ5/IxTW3H29wiZJhSKii5jSFfA/XPDTEFucT6u4VWR81dXCtd528T4vMXbF+QuWhfn5u5MZBncsWZr9YC5cKeV5Z6/qx9LpnfjHKeTNAlscv93YDYavkKt6kJX6hV/zZ3bIiJ90RxUE8UiVbY5PORRfY7uHU+Ga0MTbOj0Y0VGr++DQfrYDm1Prm0IRWFm4pjkNRZTmEZRxDtJ+IbNFfQC/SrcCSwO+e+odAgMBAAEwDQYJKoZIhvcNAQEEBQADggIBAMVyOhAHcw4iZnsjneSFWLSveEutSicl6nzjL7rRm9vQjZYna4VCYlUnnoCQoqms82KKxYohlvU1zFS90x7xKE5Of20NPIfzFSuUsxBQOtsDto+DCPoAAk3HmXcUQS/l2ZGJPeL4W6FEJrx4ewwMdN5LnrtqbaBMGJPonDWYqQHv+kPyc0a8djq3C3vFN1MfYIVSMDser7NLqgdqKjNKP00KeuiWoN72c5bgsRl+/S+QuVaZAgLkOVzN4r3RX+jIZe2TJgYzOlCuUC8/PFnFLGcukpIv2aUzGXx8mc7yhboInwbBlleN6xJnDWLwRivA9Tf6WrymH1L6KjPBBIFq9S17dXQyFRGy0BNVHaLEu3jBk8nv0cnrjI2bCBiH9rxnmqrq5VUy0gCHxlnNNKDx7cyf98/BlbtKh43t9gb3goaKUSYWO8mkA6eT6AAIpjCWFP+K8Y3R4T9jhXBfCROTa/fpzKtN9uIMMgV6oKTwnB+ATEhGhkzkSfnymz5H0orYA2gkU8OimcZCQTAtSLkXyiyE8u3O61vR5SEyb2diVIdCkqwK8dQT4NMX2LZwsXULUV7z8fclKlvImC++r1DwBDsVtbwwlE9DxviL9sBtS2MG+oZmYA0YwrIOqOvnjI7avxFV7MzzOWRC+06WNJAnHVlFCdiR1b9Q7kteqDZ0RxzC";

		// org.eclipse.higgins.sts.utilities.CertificateHelper
		// .fromString(strCertificate);

		javax.crypto.KeyGenerator keyGenerator = null;
		if (null == strEncryptionKeyGeneratorAlgorithmProvider)
			keyGenerator = javax.crypto.KeyGenerator.getInstance("AES");
		// .getInstance("strEncryptionKeyGeneratorAlgorithm");
		else
			keyGenerator = javax.crypto.KeyGenerator.getInstance("strEncryptionKeyGeneratorAlgorithm", strEncryptionKeyGeneratorAlgorithmProvider);
		keyGenerator.init(nEncryptionKeyGeneratorSize);
		final javax.crypto.SecretKey secretKey = keyGenerator.generateKey();
		final java.security.PublicKey publicKeyRP = certificate.getPublicKey();
		org.apache.xml.security.encryption.XMLCipher keyCipher = null;
		if (null == strEncryptionKeyWrapAlgorithmProvider)
			keyCipher = org.apache.xml.security.encryption.XMLCipher.getInstance(strEncryptionKeyWrapAlgorithm);
		else
			keyCipher = org.apache.xml.security.encryption.XMLCipher.getProviderInstance(strEncryptionKeyWrapAlgorithm, strEncryptionKeyWrapAlgorithmProvider);
		keyCipher.init(org.apache.xml.security.encryption.XMLCipher.WRAP_MODE, publicKeyRP);
		final org.apache.xml.security.keys.KeyInfo keyInfoKey = new org.apache.xml.security.keys.KeyInfo(domDocument);
		final java.security.MessageDigest mdSha1 = java.security.MessageDigest.getInstance("SHA-1");
		final byte[] byteThumbPrint = mdSha1.digest(certificate.getEncoded());
		final org.w3c.dom.Document domParentDocument = domParent.getOwnerDocument();
		final org.w3c.dom.Element domSTR = domParentDocument.createElementNS("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd",
				"SecurityTokenReference");
		final org.w3c.dom.Element domKeyIdentifier = domParentDocument.createElementNS("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd",
				"KeyIdentifier");
		domKeyIdentifier.setAttribute("ValueType", "http://docs.oasis-open.org/wss/oasis-wss-soap-message-security-1.1#ThumbprintSHA1");
		domKeyIdentifier.setAttribute("EncodingType", "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary");
		String strThumbprint = org.apache.xml.security.utils.Base64.encode(byteThumbPrint);
		// org.eclipse.higgins.sts.utilities.XMLHelper.setTextContent(
		// domKeyIdentifier, strThumbprint);
		domKeyIdentifier.setTextContent(strThumbprint);
		domSTR.appendChild(domKeyIdentifier);
		keyInfoKey.addUnknownElement(domSTR);
		final org.apache.xml.security.encryption.EncryptedKey encryptedKey = keyCipher.encryptKey(domDocument, secretKey);
		encryptedKey.setKeyInfo(keyInfoKey);
		final org.apache.xml.security.encryption.EncryptionMethod encryptionMethod = encryptedKey.getEncryptionMethod();
		final org.w3c.dom.Element elemDigestMethod = domDocument.createElementNS(org.apache.xml.security.utils.Constants.SignatureSpecNS, "DigestMethod");
		elemDigestMethod.setAttribute("Algorithm", strEncryptionDigestAlgorithm);
		encryptionMethod.addEncryptionMethodInformation(elemDigestMethod);
		org.apache.xml.security.encryption.XMLCipher xmlCipher = null;
		if (null == strEncryptionAlgorithmProvider)
			xmlCipher = org.apache.xml.security.encryption.XMLCipher.getInstance(strEncryptionAlgorithm);
		else
			xmlCipher = org.apache.xml.security.encryption.XMLCipher.getProviderInstance(strEncryptionAlgorithm, strEncryptionAlgorithmProvider);
		xmlCipher.init(org.apache.xml.security.encryption.XMLCipher.ENCRYPT_MODE, secretKey);
		final org.apache.xml.security.encryption.EncryptedData encryptedData = xmlCipher.getEncryptedData();
		final org.apache.xml.security.keys.KeyInfo keyInfoEncryption = new org.apache.xml.security.keys.KeyInfo(domDocument);
		keyInfoEncryption.add(encryptedKey);
		encryptedData.setKeyInfo(keyInfoEncryption);
		System.out.println("do final, encrypt the Element");
		// xmlCipher.doFinal(domDocument, domTempToEncrypt, false);
		xmlCipher.doFinal(domDocument, domTempToEncrypt, false);
		final org.w3c.dom.NodeList nlEncryptedData = domTempParent.getElementsByTagNameNS(org.apache.xml.security.utils.EncryptionConstants.EncryptionSpecNS, "EncryptedData");
		if (1 != nlEncryptedData.getLength()) {
			throw new Exception("One EncryptedData Not Found!");
		}
		org.w3c.dom.Element domEncryptedData = (org.w3c.dom.Element) nlEncryptedData.item(0);
		System.out.println("********************" + domEncryptedData.getNodeType());
		// org.eclipse.higgins.sts.utilities.XMLHelper
		// .stripNewLinesFromElement((org.w3c.dom.Element) nlEncryptedData
		// .item(0));
		domParent.replaceChild(domEncryptedData, domToEncrypt);

		System.out.println("encrypt:" + domEncryptedData);
		// org.w3c.dom.Element elemResult = null;
		// elemResult.set(domParent);
		return domParent;
		// return domEncryptedData;
	}

	// **************

	// 基于xml元素的加密和解密 解密函数
	public static org.w3c.dom.Element DecryptElement(final org.w3c.dom.Element elemEncryptedData, final PrivateKey privateKey) throws Exception {
		String strEncryptionAlgorithm = org.apache.xml.security.encryption.XMLCipher.AES_128;

		String strEncryptionAlgorithmProvider = null;

		String strEncryptionKeyGeneratorAlgorithm = "AES";

		// int nEncryptionKeyGeneratorSize = 128;

		String strEncryptionKeyWrapAlgorithm = org.apache.xml.security.encryption.XMLCipher.RSA_OAEP;

		String strEncryptionKeyWrapAlgorithmProvider = null;

		// XMLSecurityApacheExtension.log.trace("DecryptElement");

		final org.w3c.dom.Element domEncryptedData = elemEncryptedData;
		final org.w3c.dom.NodeList nlEncryptedKey = domEncryptedData.getElementsByTagNameNS(org.apache.xml.security.utils.EncryptionConstants.EncryptionSpecNS,
				org.apache.xml.security.utils.EncryptionConstants._TAG_ENCRYPTEDKEY);
		if (null == nlEncryptedKey) {
			// XMLSecurityApacheExtension.log.trace("No EncryptedKey found (getElementsByTagName returned null)");
		} else if (0 == nlEncryptedKey.getLength()) {
			// XMLSecurityApacheExtension.log.trace("No EncryptedKey found (0 == getLength())");
		} else {
			final org.w3c.dom.Document domDocument = domEncryptedData.getOwnerDocument();
			final org.w3c.dom.Element elemEncryptedKey = (org.w3c.dom.Element) nlEncryptedKey.item(0);
			final org.w3c.dom.NodeList nlKeyEncryptionMethod = elemEncryptedKey.getElementsByTagNameNS(org.apache.xml.security.utils.EncryptionConstants.EncryptionSpecNS,
					org.apache.xml.security.utils.EncryptionConstants._TAG_ENCRYPTIONMETHOD);
			String strKeyEncryptionMethod = null;
			if (null == nlKeyEncryptionMethod) {
				// XMLSecurityApacheExtension.log.trace("No EncryptionMethod found");
				strKeyEncryptionMethod = strEncryptionKeyWrapAlgorithm;
			} else if (0 == nlKeyEncryptionMethod.getLength()) {
				// XMLSecurityApacheExtension.log.trace("No EncryptionMethod found");
				strKeyEncryptionMethod = strEncryptionKeyWrapAlgorithm;
			} else {
				final org.w3c.dom.Element elemKeyEncryptionMethod = (org.w3c.dom.Element) nlKeyEncryptionMethod.item(0);
				strKeyEncryptionMethod = elemKeyEncryptionMethod.getAttribute(org.apache.xml.security.utils.EncryptionConstants._ATT_ALGORITHM);
			}
			org.apache.xml.security.encryption.XMLCipher keyCipher = null;
			if (null == strEncryptionKeyWrapAlgorithmProvider)
				keyCipher = org.apache.xml.security.encryption.XMLCipher.getInstance(strKeyEncryptionMethod);
			else
				keyCipher = org.apache.xml.security.encryption.XMLCipher.getProviderInstance(strKeyEncryptionMethod, strEncryptionKeyWrapAlgorithmProvider);
			keyCipher.init(org.apache.xml.security.encryption.XMLCipher.UNWRAP_MODE, privateKey);
			final org.apache.xml.security.encryption.EncryptedKey encryptedKey = keyCipher.loadEncryptedKey(domDocument, elemEncryptedKey);
			final java.security.Key keySecret = keyCipher.decryptKey(encryptedKey, strEncryptionKeyWrapAlgorithm);// 用私钥去解密出对称密钥

			final javax.crypto.SecretKey secretKey = (javax.crypto.SecretKey) keySecret;// 对称密钥
			final byte[] encodedSecretKey = secretKey.getEncoded();
			final javax.crypto.spec.SecretKeySpec secretKeySpec = new javax.crypto.spec.SecretKeySpec(encodedSecretKey, strEncryptionKeyGeneratorAlgorithm);// AES类型的密钥
			org.apache.xml.security.encryption.XMLCipher xmlCipher = null;
			if (null == strEncryptionAlgorithmProvider)
				xmlCipher = org.apache.xml.security.encryption.XMLCipher.getInstance(strEncryptionAlgorithm);
			else
				xmlCipher = org.apache.xml.security.encryption.XMLCipher.getProviderInstance(strEncryptionAlgorithm, strEncryptionAlgorithmProvider);
			xmlCipher.init(org.apache.xml.security.encryption.XMLCipher.DECRYPT_MODE, secretKeySpec);
			final org.w3c.dom.Document domResultDocument = xmlCipher.doFinal(domDocument, domEncryptedData, false);
			// final org.eclipse.higgins.sts.api.IElement elemResult = new
			// org.eclipse.higgins.sts.common.Element();
			// elemResult.set
			// (domResultDocument.getDocumentElement());
			return domResultDocument.getDocumentElement();
		}
		return null;
	}

	// java实现xml的签名和验证
	// 签名函数
	public static Element SignEnveloped(final String strTagNameOfElementsToSign, final Element elemParent, final String strReferenceIdentifier, final PrivateKey privateKey,
			final PublicKey publicKey, final String constants) throws Exception {
		org.apache.xml.security.Init.init();
		String strSignatureAlgorithm = org.apache.xml.security.signature.XMLSignature.ALGO_ID_SIGNATURE_RSA_SHA1;

		String strSignatureCanonicalizationAlgorithm = org.apache.xml.security.transforms.Transforms.TRANSFORM_C14N_EXCL_OMIT_COMMENTS;

		String strReferenceCanonicalizationAlgorithm = org.apache.xml.security.transforms.Transforms.TRANSFORM_C14N_EXCL_OMIT_COMMENTS;

		String strReferenceDigestAlgorithm = org.apache.xml.security.utils.Constants.ALGO_ID_DIGEST_SHA1;

		if (null == strTagNameOfElementsToSign) {
			throw new Exception("Sign Failed: Invalid Parameter: TagNameOfElementsToSign is null");
		}
		if (null == elemParent) {
			throw new Exception("Sign Failed: Invalid Parameter: Parent is null");
		}
		// if (null == strReferenceIdentifier)
		// {
		// throw new
		// Exception("Sign Failed: Invalid Parameter: ReferenceIdentifier is null");
		// }
		if (null == privateKey) {
			throw new Exception("Sign Failed: Invalid Parameter: PrivateKey is null");
		}
		if (null == publicKey) {
			throw new Exception("Sign Failed: Invalid Parameter: PublicKey is null");
		}
		if (null == constants) {
			throw new Exception("Sign Failed: Invalid Parameter: Constants is null");
		}
		//org.apache.xml.security.utils.Constants.setSignatureSpecNSprefix("ds");
		
		org.w3c.dom.Element domParent = elemParent;
		final org.w3c.dom.Document domDocument = domParent.getOwnerDocument();
		final org.w3c.dom.NodeList nlToSigns = domParent.getElementsByTagName(strTagNameOfElementsToSign);
		if (null == nlToSigns) {
			final String strErrorMessage = "org.w3c.dom.Element.getElementsByTagNameNS unexpectedly returned null";
			// XMLSecurityApacheExtension.log.error
			// (strErrorMessage);
			throw new Exception("Sign Failed: " + strErrorMessage);
		}
		if (1 != nlToSigns.getLength()) {
			final String strErrorMessage = "org.w3c.dom.Element.getElementsByTagNameNS unexpectedly returned " + nlToSigns.getLength() + " nodes";
			// XMLSecurityApacheExtension.log.error
			// (strErrorMessage);
			throw new Exception("Sign Failed: " + strErrorMessage);
		}
		final org.w3c.dom.Element domToSign = (Element) nlToSigns.item(0);
		final org.apache.xml.security.signature.XMLSignature signature = new org.apache.xml.security.signature.XMLSignature(domDocument, "", strSignatureAlgorithm,
				strSignatureCanonicalizationAlgorithm);
		domToSign.appendChild(signature.getElement());
		final org.apache.xml.security.signature.SignedInfo signedInfo = signature.getSignedInfo();
		//final IDResolver resolver = new IDResolver(domDocument);
		//signedInfo.addResourceResolver(resolver);
		final org.apache.xml.security.transforms.Transforms transforms = new org.apache.xml.security.transforms.Transforms(domDocument);
		transforms.addTransform(org.apache.xml.security.transforms.Transforms.TRANSFORM_ENVELOPED_SIGNATURE);
		transforms.addTransform(strReferenceCanonicalizationAlgorithm);
		// signature.addDocument
		// ("#" + strReferenceIdentifier,
		// transforms,
		// strReferenceDigestAlgorithm);
		signature.addDocument("#" + strReferenceIdentifier, transforms, strReferenceDigestAlgorithm);
		signature.addKeyInfo(publicKey);
		signature.sign(privateKey);
		final org.w3c.dom.Element elemSignature = signature.getElement();
		return elemSignature;
		// final org.w3c.dom.NodeList nodeListSignatureValue =
		// elemSignature.getElementsByTagNameNS
		// (constants,
		// "SignatureValue");
		// final org.w3c.dom.Element elemSignatureValue =
		// (org.w3c.dom.Element)nodeListSignatureValue.item(0);
		// org.eclipse.higgins.sts.utilities.XMLHelper.stripWhiteSpaceFromElement(elemSignatureValue);
		// domParent =
		// org.eclipse.higgins.sts.utilities.XMLHelper.reparseElement
		// (domParent);
		// org.eclipse.higgins.sts.api.IElement elemResult = new
		// org.eclipse.higgins.sts.common.Element();
		// elemResult.set(domParent);
		// return elemResult;
		// Document doc = elemSignatureValue.getOwnerDocument();
		// Element sign = doc.getDocumentElement();
		// return sign;
	}

	// java实现xml的签名和验证
	// 验证函数

	public static boolean VerifyEnveloped(final Element elemSignedElement) throws Exception {
		org.apache.xml.security.Init.init();

		if (null == elemSignedElement) {
			throw new Exception("Verify Failed: Invalid Parameter: SignedElement is null");
		}
		// if (null == constants)
		// {
		// throw new
		// Exception("Verify Failed: Invalid Parameter: Constants is null");
		// }
		final org.w3c.dom.Element domSignedElement = (org.w3c.dom.Element) elemSignedElement;
		final org.w3c.dom.Document domParent = domSignedElement.getOwnerDocument();
		final Element elemContext = org.apache.xml.security.utils.XMLUtils.createDSctx(domParent, "ds", org.apache.xml.security.utils.Constants.SignatureSpecNS);
		final Element elemSignature = (Element) org.apache.xpath.XPathAPI.selectSingleNode(domParent, "//ds:Signature", elemContext);
		// final org.apache.xml.security.signature.XMLSignature signature = new
		// org.apache.xml.security.signature.XMLSignature
		// (elemSignature,
		// null);
		final org.apache.xml.security.signature.XMLSignature signature = new org.apache.xml.security.signature.XMLSignature(elemSignedElement, null);
		//signature.addResourceResolver(new IDResolver(domParent));

		final org.apache.xml.security.keys.KeyInfo keyInfo = signature.getKeyInfo();
		boolean bResult = false;
		if (keyInfo != null) {
			if (keyInfo.containsX509Data()) {
				System.out.println("Found a X509Data element in the KeyInfo");
			}
			final java.security.cert.X509Certificate cert = signature.getKeyInfo().getX509Certificate();
			if (cert != null) {
				bResult = signature.checkSignatureValue(cert);
			} else {
				System.out.println("Did not find an X509Data element in the KeyInfo");
				final PublicKey publicKey = keyInfo.getPublicKey();
				if (publicKey != null) {
					bResult = signature.checkSignatureValue(publicKey);
				} else {
					System.out.println("Did not find a public key, so I can't check the signature");
				}
			}
		} else {
			System.out.println("Did not find a KeyInfo");
		}
		return bResult;
	}
	
}
