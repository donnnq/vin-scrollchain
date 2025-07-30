// vinScrollSentimentAnalyzer.sol
contract vinScrollSentimentAnalyzer {
    enum SentimentType { PeacefulProcessing, RationalReform, VengefulNoise, MisinformedBuzz }

    mapping(address => SentimentType) public sentimentLog;
    event SentimentCaptured(address indexed viewer, SentimentType emotion, string scrollReference, uint timestamp);

    modifier assessInputOnly(string memory scrollReference) {
        require(bytes(scrollReference).length > 0, "Scroll context required.");
    }

    function logSentiment(address viewer, SentimentType emotion, string memory scrollReference)
        public assessInputOnly(scrollReference) 
    {
        sentimentLog[viewer] = emotion;
        emit SentimentCaptured(viewer, emotion, scrollReference, block.timestamp);
    }

    function getSentiment(address viewer) public view returns (SentimentType) {
        return sentimentLog[viewer];
    }
}
