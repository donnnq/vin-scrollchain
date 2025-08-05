// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDiplomaticSigilSanctuary {
    struct PeaceSigil {
        string sigilName;
        string originNation;
        string intentDescription;
        bool active;
    }

    PeaceSigil[] public sanctifiedSigils;
    address public harmonyArchitect;

    event SigilActivated(string name, string origin, string intent);
    event PeacePledgeRecorded(string declaration);

    modifier onlyArchitect() {
        require(msg.sender == harmonyArchitect, "Unauthorized architect");
        _;
    }

    constructor(address _architect) {
        harmonyArchitect = _architect;
    }

    function activateSigil(string memory name, string memory originNation, string memory intentDescription) external onlyArchitect {
        sanctifiedSigils.push(PeaceSigil(name, originNation, intentDescription, true));
        emit SigilActivated(name, originNation, intentDescription);
    }

    function declarePeacePledge(string memory declaration) external onlyArchitect {
        emit PeacePledgeRecorded(declaration);
    }
}
