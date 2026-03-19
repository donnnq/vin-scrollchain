// SystemicThreatAccountabilityProtocol.sol
pragma solidity ^0.8.0;

contract SystemicThreatAccountabilityProtocol {
    struct Rule {
        uint256 id;
        string safeguard;   // e.g. "Prevent AI-Driven Systemic Risk"
        string mechanism;   // e.g. "Mandate insurer audits for AI incidents"
        uint256 timestamp;
    }

    uint256 public ruleCount;
    mapping(uint256 => Rule) public rules;

    event RuleLogged(uint256 id, string safeguard, string mechanism);

    function logRule(string memory safeguard, string memory mechanism) public {
        ruleCount++;
        rules[ruleCount] = Rule(ruleCount, safeguard, mechanism, block.timestamp);
        emit RuleLogged(ruleCount, safeguard, mechanism);
    }
}
