<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Chat - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .chat-container {
            width: 400px;
            background: #121212;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(255, 215, 0, 0.5);
            overflow: hidden;
        }
        .chat-header {
            background: #ffcc00;
            color: black;
            padding: 15px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            position: relative;
        }
        .back-button {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: black;
        }
        .chat-box {
            height: 300px;
            overflow-y: auto;
            padding: 15px;
            display: flex;
            flex-direction: column;
        }
        .chat-message {
            background: #222;
            padding: 10px;
            border-radius: 5px;
            margin: 5px 0;
            max-width: 70%;
        }
        .user-message {
            background: #ffcc00;
            color: black;
            align-self: flex-end;
        }
        .bot-message {
            background: #333;
            color: white;
            align-self: flex-start;
        }
        .chat-input {
            display: flex;
            padding: 10px;
            background: #111;
        }
        .chat-input input {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #222;
            color: white;
        }
        .chat-input button {
            padding: 10px;
            margin-left: 10px;
            border: none;
            background: #ffcc00;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;
            color: black;
        }
        .suggestions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            padding: 10px;
            background: #222;
            text-align: center;
        }
        .suggestion-btn {
            padding: 8px 12px;
            background: #ffcc00;
            color: black;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <button class="back-button" onclick="goBack()">
                <i class="fas fa-arrow-left"></i>
            </button>
            Live Chat - Support
        </div>
       
        <div class="chat-box" id="chatBox">
            <div class="chat-message bot-message">Hello! How can I assist you today?</div>
        </div>
        <div class="suggestions" id="suggestions">
            <button class="suggestion-btn" onclick="setSuggestion(this)">How do I book a cab?</button>
            <button class="suggestion-btn" onclick="setSuggestion(this)">What are your rates?</button>
            <button class="suggestion-btn" onclick="setSuggestion(this)">Do you operate 24/7?</button>
            <button class="suggestion-btn" onclick="setSuggestion(this)">Can I schedule a ride?</button>
            <button class="suggestion-btn" onclick="setSuggestion(this)">Thank you!</button>
        </div>
        <div class="chat-input">
            <input type="text" id="userInput" placeholder="Type your message...">
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
<script>
function goBack() {
    window.history.back();
}
    function sendMessage() {
        let userInputField = document.getElementById("userInput");
        let userInput = userInputField.value.trim();
        if (userInput === "") return;

        let chatBox = document.getElementById("chatBox");

        // Append user message
        let userMessage = document.createElement("div");
        userMessage.classList.add("chat-message", "user-message");
        userMessage.textContent = userInput;
        chatBox.appendChild(userMessage);

        userInputField.value = ""; // Clear input field

        // Scroll to the latest message
        chatBox.scrollTop = chatBox.scrollHeight;

        // Simulate bot response after a short delay
        setTimeout(() => {
            let botMessage = document.createElement("div");
            botMessage.classList.add("chat-message", "bot-message");

            let response = getBotResponse(userInput);
            botMessage.textContent = response;

            chatBox.appendChild(botMessage);
            chatBox.scrollTop = chatBox.scrollHeight;
        }, 1000);
    }

    function getBotResponse(input) {
        let responses = {
            "how do i book a cab?": "You can book a cab by using our online booking form or calling us directly.",
            "what are your rates?": "Our rates depend on distance and car type. Please visit our pricing page for more details.",
            "do you operate 24/7?": "Yes! We offer 24/7 taxi services to meet your travel needs.",
            "can i schedule a ride?": "Yes, you can schedule a ride in advance using our booking system.",
            "thank you!": "You're welcome! Let me know if you need further assistance."
        };
        
        return responses[input.toLowerCase()] || "I'm not sure about that. Please contact our support team for more details.";
    }

    function setSuggestion(button) {
        document.getElementById("userInput").value = button.textContent;
        sendMessage();
    }
</script>

</body>
</html>