// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinPacificPamanaVault {
    struct Pamana {
        string vesselName;
        string legacyNote;
        string blessing;
        uint256 timestamp;
        address enshrinedBy;
    }

    Pamana[] public vault;

    event PamanaStored(string vesselName, string legacyNote, string blessing, address enshrinedBy);

    function storePamana(string memory vesselName, string memory legacyNote, string memory blessing) public {
        vault.push(Pamana(vesselName, legacyNote, blessing, block.timestamp, msg.sender));
        emit PamanaStored(vesselName, legacyNote, blessing, msg.sender);
    }

    function getPamana(uint index) public view returns (
        string memory, string memory, string memory, uint256, address
    ) {
        Pamana memory p = vault[index];
        return (p.vesselName, p.legacyNote, p.blessing, p.timestamp, p.enshrinedBy);
    }

    function totalPamana() public view returns (uint) {
        return vault.length;
    }
}
