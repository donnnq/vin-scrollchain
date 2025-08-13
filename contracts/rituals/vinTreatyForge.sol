// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinTreatyForge {
    struct Treaty {
        string title;
        string[] signatories;
        string purpose;
        uint256 timestamp;
        address initiator;
    }

    Treaty[] public treaties;

    event TreatyForged(string title, string purpose, address initiator);

    function forgeTreaty(
        string memory title,
        string[] memory signatories,
        string memory purpose
    ) public {
        treaties.push(Treaty(title, signatories, purpose, block.timestamp, msg.sender));
        emit TreatyForged(title, purpose, msg.sender);
    }

    function getTreaty(uint index) public view returns (
        string memory, string[] memory, string memory, uint256, address
    ) {
        Treaty memory t = treaties[index];
        return (t.title, t.signatories, t.purpose, t.timestamp, t.initiator);
    }

    function totalTreaties() public view returns (uint) {
        return treaties.length;
    }
}
