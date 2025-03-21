package com.datapackage.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.mail.util.ByteArrayDataSource;
import jakarta.activation.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.Properties;

@WebServlet("/GeneratePDFServlet")
public class GeneratePDFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Booking_Invoice.pdf");

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, baos);
            document.open();

            HttpSession session = request.getSession();

            // Fetch session attributes
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
            String fromLocation = (String) session.getAttribute("fromLocation");
            String toLocation = (String) session.getAttribute("toLocation");
            String datetime = (String) session.getAttribute("datetime");

            String paymentMethod = (String) session.getAttribute("paymentMethod");
            String paymentDetails = (String) session.getAttribute("paymentDetails");
            double amountPaid = session.getAttribute("amount") instanceof Double ? (double) session.getAttribute("amount") : 0.0;
            String paymentStatus = (String) session.getAttribute("paymentStatus");

            // Title (Bold & Large)
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
            Paragraph title = new Paragraph("Booking Invoice\n\n", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph("================================================================"));

            // Customer Details
            document.add(new Paragraph("Customer Details\n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14)));
            document.add(new Paragraph("Name: " + (name != null ? name : "N/A")));
            document.add(new Paragraph("Email: " + (email != null ? email : "N/A")));
            document.add(new Paragraph("Phone: " + (phone != null ? phone : "N/A")));
            document.add(new Paragraph("From: " + (fromLocation != null ? fromLocation : "N/A")));
            document.add(new Paragraph("To: " + (toLocation != null ? toLocation : "N/A")));
            document.add(new Paragraph("Date & Time: " + (datetime != null ? datetime : "N/A")));
            document.add(new Paragraph("\n"));

            // Payment Details
            document.add(new Paragraph("Payment Details\n", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14)));
            document.add(new Paragraph("Payment Method: " + (paymentMethod != null ? paymentMethod : "N/A")));
            document.add(new Paragraph("Payment Details: " + (paymentDetails != null ? paymentDetails : "N/A")));
            document.add(new Paragraph("Amount Paid: RS. " + amountPaid));
            document.add(new Paragraph("Payment Status: " + (paymentStatus != null ? paymentStatus : "N/A")));
            document.add(new Paragraph("\n"));

            // Thank You Message
            document.add(new Paragraph("======================================================================"));
            Paragraph thankYou = new Paragraph("Thank you for choosing our service!", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12));
            thankYou.setAlignment(Element.ALIGN_CENTER);
            document.add(thankYou);

            document.close();

            // Send PDF via email
            sendEmailWithAttachment(email, baos.toByteArray());

            // Write PDF to HTTP response
            response.getOutputStream().write(baos.toByteArray());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendEmailWithAttachment(String recipientEmail, byte[] pdfData) throws MessagingException, IOException {
        String senderEmail = "kalanirajapaksha.net@gmail.com"; 
        String senderPassword = "dyom hnwz ppum beww"; 

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Payment Confirmation and Invoice");

        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setText("Thank you for your payment. Please find your invoice attached.");

        MimeBodyPart attachmentPart = new MimeBodyPart();
        DataSource dataSource = new ByteArrayDataSource(pdfData, "application/pdf");
        attachmentPart.setDataHandler(new DataHandler(dataSource));
        attachmentPart.setFileName("Booking_Invoice.pdf");

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        multipart.addBodyPart(attachmentPart);

        message.setContent(multipart);

        Transport.send(message);
    }
}
