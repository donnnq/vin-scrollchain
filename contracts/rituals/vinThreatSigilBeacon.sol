// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinThreatSigilBeacon {
    address public containmentNode;
    mapping(bytes32 => string) public activeDefensiveSigils;
    mapping(string => bool) public globalLockStatus;

    event SigilBroadcasted(bytes32 signalID, string sigilType, string message);
    event LockdownDeclared(string threatCategory, string consequence);

    modifier onlyContainment() {
        require(msg.sender == containmentNode, "Unauthorized broadcast trigger");
        _;
    }

    constructor(address _containmentNode) {
        containmentNode = _containmentNode;
    }

    function broadcastSigil(bytes32 signalID, string memory threatCategory) public onlyContainment {
        string memory sigilType = mapSigil(threatCategory);
        activeDefensiveSigils[signalID] = sigilType;
        globalLockStatus[threatCategory] = true;

        emit SigilBroadcasted(signalID, sigilType, "Elemental defense activated — hostile vectors nullified.");
        emit LockdownDeclared(threatCategory, "Control surfaces sealed across scrollchain.");
    }

    function mapSigil(string memory category) internal pure returns (string memory) {
        if (keccak256(bytes(category)) == keccak256("NuclearIntent")) return "NullSigil";
        if (keccak256(bytes(category)) == keccak256("AIOverdrive")) return "LogicQuarantineSigil";
        if (keccak256(bytes(category)) == keccak256("BioHazard")) return "SporeSealSigil";
        if (keccak256(bytes(category)) == keccak256("CyberCollapse")) return "EchoFirewallSigil";
        return "VoidContainmentSigil";
    }

    function getSigilType(bytes32 signalID) public view returns (string memory) {
        return activeDefensiveSigils[signalID];
    }

    function isLocked(string memory category) public view returns (bool) {
        return globalLockStatus[category];
    }

    function updateContainmentNode(address newNode) public onlyContainment {
        containmentNode = newNode;
    }
}
