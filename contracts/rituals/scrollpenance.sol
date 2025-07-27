contract ScrollPenance {
    mapping(address => uint8) public shamePoints;
    event PenanceServed(address indexed violator, string ritual);

    function recordViolation(address violator, uint8 severity) external {
        shamePoints[violator] += severity;
        emit PenanceServed(violator, selectRitual(severity));
    }

    function selectRitual(uint8 severity) internal pure returns (string memory) {
        if (severity > 7) return "Public scrollwalk & cringe karaoke";
        if (severity > 3) return "Sock mismatch protocol";
        return "Scroll silence & meme meditation";
    }
}
