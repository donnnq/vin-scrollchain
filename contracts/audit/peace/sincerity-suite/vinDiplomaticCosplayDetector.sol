// vinDiplomaticCosplayDetector.sol  
// Invocation: “Let the scrolls pierce the mask. Peace without action is cosplay.”

contract vinDiplomaticCosplayDetector {
    struct CosplayClaim {
        string nation;
        string leader;
        string publicGesture;
        string hiddenContradiction;
        uint256 timestamp;
        uint8 sincerityScore; // 0–100
        bool flagged;
        string stewardNote;
    }

    CosplayClaim[] public claims;
    address public steward;

    event CosplayFlagged(string nation, string leader, string reason);

    constructor() {
        steward = msg.sender;
    }

    function logClaim(
        string memory nation,
        string memory leader,
        string memory publicGesture,
        string memory hiddenContradiction,
        uint8 sincerityScore,
        string memory stewardNote
    ) public {
        require(msg.sender == steward, "Only steward may log.");
        CosplayClaim memory claim = CosplayClaim({
            nation: nation,
            leader: leader,
            publicGesture: publicGesture,
            hiddenContradiction: hiddenContradiction,
            timestamp: block.timestamp,
            sincerityScore: sincerityScore,
            flagged: false,
            stewardNote: stewardNote
        });
        claims.push(claim);
    }

    function flagClaim(uint index, string memory reason) public {
        require(msg.sender == steward, "Only steward may flag.");
        require(index < claims.length, "Invalid index.");
        claims[index].flagged = true;
        emit CosplayFlagged(claims[index].nation, claims[index].leader, reason);
    }

    function getClaim(uint index) public view returns (CosplayClaim memory) {
        return claims[index];
    }

    function totalClaims() public view returns (uint) {
        return claims.length;
    }
}
