package com.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {

   @Override
   protected PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication("ddomungyang@gmail.com","ezen2020");
   }
}