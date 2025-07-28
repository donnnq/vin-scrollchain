contract vinCivicDecisionVault {
    struct Decision {
        string action;
        address initiator;
        uint256 timestamp;
    }

    Decision[] public decisions;

    event DecisionLogged(uint256 id, string action, address initiator);

    function logDecision(string memory action) public {
        decisions.push(Decision(action, msg.sender, block.timestamp));
        emit DecisionLogged(decisions.length - 1, action, msg.sender);
    }

    function viewDecision(uint256 id) public view returns (Decision memory) {
        return decisions[id];
    }
}
