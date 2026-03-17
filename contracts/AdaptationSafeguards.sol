// AdaptationSafeguards.sol
pragma solidity ^0.8.0;

contract AdaptationSafeguards {
    struct Safeguard {
        uint256 id;
        string principle;   // e.g. "Embrace AI Tools"
        string measure;     // e.g. "Integrate ChatGPT as employee #1"
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
