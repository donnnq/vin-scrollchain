contract vinWisdomSynth {
    struct Reflection {
        string action;
        string feedback;
        uint8 satisfactionScore; // 0 to 10
        uint256 timestamp;
    }

    Reflection[] public reflections;

    event FeedbackLogged(string action, string feedback, uint8 score);

    function logFeedback(string memory action, string memory feedback, uint8 score) public {
        require(score <= 10, "Score must be 0-10");
        reflections.push(Reflection(action, feedback, score, block.timestamp));
        emit FeedbackLogged(action, feedback, score);
    }

    function getReflection(uint256 index) public view returns (Reflection memory) {
        return reflections[index];
    }
}
