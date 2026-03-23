// OilRoutesSafeguards.sol
pragma solidity ^0.8.0;

contract OilRoutesSafeguards {
    struct Safeguard {
        uint256 id;
        string principle;   // e.g. "Diversify Oil Supply Routes"
        string measure;     // e.g. "Mandate regional partnerships to secure cheaper imports"
        uint256 timestamp;
    }

    uint256 public safeguardCount;
    mapping(uint256 => Safeguard) public safeguards;

    event SafeguardLogged(uint256 id, string principle, string measure);

    function logSafeguard(string memory principle, string memory measure) public {
        safeguardCount++;
        safeguards[safeguardCount] = Safeguard(safeguardCount, principle, measure, block.timestamp);
        emit SafeguardLogged(safeguardCount, principle, measure);
    }
}
