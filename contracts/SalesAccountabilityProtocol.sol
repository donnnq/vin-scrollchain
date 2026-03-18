// SalesAccountabilityProtocol.sol
pragma solidity ^0.8.0;

contract SalesAccountabilityProtocol {
    struct Rule {
        uint256 id;
        string safeguard;   // e.g. "Respect Team Well-being"
        string mechanism;   // e.g. "Normal workdays, chill weekends"
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
