/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package until;

import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;

/**
 *
 * @author catmi
 */
public class VNPayPayment {
    private static final String VNPAY_URL = "https://pay.vnpay.vn/vpcpay.html";
    private static final String VNPAY_RETURN_URL = "http://your_return_url";
    private static final String VNPAY_TMN_CODE = "YourMerchantCode";
    private static final String VNPAY_HASH_SECRET = "YourSecretKey";

    public static void main(String[] args) throws Exception {
        Map<String, String> vnpParams = new HashMap<>();
        vnpParams.put("vnp_Version", "2.0.0");
        vnpParams.put("vnp_Command", "pay");
        vnpParams.put("vnp_TmnCode", VNPAY_TMN_CODE);
        vnpParams.put("vnp_Amount", "1000000"); // Số tiền tính bằng VND * 100
        vnpParams.put("vnp_CurrCode", "VND");
        vnpParams.put("vnp_TxnRef", "123456");
        vnpParams.put("vnp_OrderInfo", "Payment for order 123456");
        vnpParams.put("vnp_Locale", "vn");
        vnpParams.put("vnp_ReturnUrl", VNPAY_RETURN_URL);
        vnpParams.put("vnp_IpAddr", "127.0.0.1");

        String queryUrl = getQueryUrl(vnpParams);
        String paymentUrl = VNPAY_URL + "?" + queryUrl;
        System.out.println("Payment URL: " + paymentUrl);
    }
    private static String getQueryUrl(Map<String, String> params) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String hashData = params.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(e -> e.getKey() + "=" + e.getValue())
                .collect(Collectors.joining("&"));

        String vnp_SecureHash = sha256(VNPAY_HASH_SECRET + hashData);
        params.put("vnp_SecureHash", vnp_SecureHash);

        return params.entrySet().stream()
                .map(e -> urlEncode(e.getKey()) + "=" + urlEncode(e.getValue()))
                .collect(Collectors.joining("&"));
    }
    private static String sha256(String base) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(base.getBytes());
        StringBuilder hexString = new StringBuilder();

        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }

        return hexString.toString();
    }
    private static String urlEncode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}
