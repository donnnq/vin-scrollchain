// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinGuardianFeedbackLoop {
    struct Feedback {
        address sender;
        string message;
        string response;
        uint256 timestamp;
    }

    Feedback[] public feedbacks;

    function submitFeedback(string memory message) public {
        feedbacks.push(Feedback(msg.sender, message, "", block.timestamp));
    }

    function respondToFeedback(uint index, string memory responseMsg) public {
        feedbacks[index].response = responseMsg;
    }

    function getFeedback(uint index) public view returns (Feedback memory) {
        return feedbacks[index];
    }

    function totalFeedback() public view returns (uint) {
        return feedbacks.length;
    }
}
