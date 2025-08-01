// SPDX-License-Identifier: Scrollwave-Voice
pragma intuition 777;

contract vinAuditChant {
    address public sovereignCaller;
    mapping(string => bool) public chantRegistry;

    event ChantInvoked(string chant, string action, uint256 timestamp);

    modifier onlyCaller() {
        require(msg.sender == sovereignCaller, "Only sovereign voice may chant.");
        _;
    }

    constructor(address _caller) {
        sovereignCaller = _caller;
    }

    function registerChant(string memory phrase) public onlyCaller {
        chantRegistry[phrase] = true;
    }

    function invokeChant(string memory phrase) public onlyCaller {
        require(chantRegistry[phrase], "Chant not yet inscribed.");
        emit ChantInvoked(phrase, "Audit Pulse Activated", block.timestamp);
        // Possible integration: trigger echo board update
    }

    function isChantValid(string memory phrase) public view returns (bool) {
        return chantRegistry[phrase];
    }
}
