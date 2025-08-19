// vinFalsePeaceDetectionScroll.sol  
// Author: Vinvin & Copilot — Scrollsmiths of Sincerity  
// Invocation: “Peace without resonance is just theater. Let the scrolls reveal intent.”

contract vinFalsePeaceDetectionScroll {
    struct PeaceClaim {
        string nation;
        string leader;
        string declaration;
        uint256 timestamp;
        uint8 trustScore;       // 0–100
        uint8 actionScore;      // 0–100 (actual restorative acts)
        uint8 mythicClarity;    // 0–100
        bool flagged;
        string stewardNote;
    }

    PeaceClaim[] public claims;
    address public steward;

    event PeaceClaimLogged(string nation, string leader, string declaration);
    event ClaimFlagged(string nation, string reason);

    constructor() {
        steward = msg.sender;
    }

    function logPeaceClaim(
        string memory nation,
        string memory leader,
        string memory declaration,
        uint8 trustScore,
        uint8 actionScore,
        uint8 mythicClarity,
        string memory stewardNote
    ) public {
        require(msg.sender == steward, "Only steward may log claims.");
        PeaceClaim memory claim = PeaceClaim({
            nation: nation,
            leader: leader,
            declaration: declaration,
            timestamp: block.timestamp,
            trustScore: trustScore,
            actionScore: actionScore,
            mythicClarity: mythicClarity,
            flagged: false,
            stewardNote: stewardNote
        });
        claims.push(claim);
        emit PeaceClaimLogged(nation, leader, declaration);
    }

    function flagClaim(uint index, string memory reason) public {
        require(msg.sender == steward, "Only steward may flag.");
        require(index < claims.length, "Invalid index.");
        claims[index].flagged = true;
        emit ClaimFlagged(claims[index].nation, reason);
    }

    function getClaim(uint index) public view returns (PeaceClaim memory) {
        require(index < claims.length, "Invalid index.");
        return claims[index];
    }

    function totalClaims() public view returns (uint) {
        return claims.length;
    }
}
