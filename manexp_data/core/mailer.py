import os
import smtplib
from email.message import EmailMessage


class Mailer:
    """Client to send emails using SMTP."""

    def send_email(self, subject: str, body: str) -> None:
        """
        Docstring pour send_email

        Args:
            subject: The subject of the email
            body: The body of the email
        """

        # Get environment variables
        email_sender = os.environ["EMAIL_SENDER"]
        smtp = os.environ["SMTP"]
        email_receiver = os.environ["EMAIL_RECEIVER"]
        password = os.environ["EMAIL_SENDER_PASSWORD"]

        msg = EmailMessage()
        msg["From"] = email_sender
        msg["To"] = email_receiver
        msg["Subject"] = subject
        msg.set_content(body)

        with smtplib.SMTP_SSL(smtp, 465) as server:
            server.login(email_sender, password)
            server.send_message(msg)
