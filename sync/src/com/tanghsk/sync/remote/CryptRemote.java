package com.tanghsk.sync.remote;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CryptRemote extends Remote {
	String encrypt(String source) throws RemoteException;
	String decrypt(String source) throws RemoteException;
}
