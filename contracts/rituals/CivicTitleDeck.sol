// SPDX-License-Identifier: CivicHonor
pragma solidity ^0.8.0;

contract CivicTitleDeck {
    address public steward;

    struct Title {
        address recipient;
        string name;
        string barangay;
        string honorific;
        uint256 timestamp;
    }

    Title[] public titles;

    event TitleBestowed(address indexed recipient, string honorific, string barangay);

    constructor() {
        steward = msg.sender;
    }

    function bestowTitle(address recipient, string memory name, string memory barangay, string memory honorific) public {
        require(msg.sender == steward, "Only steward may bestow titles");
        titles.push(Title(recipient, name, barangay, honorific, block.timestamp));
        emit TitleBestowed(recipient, honorific, barangay);
    }

    function getTitle(uint256 index) public view returns (Title memory) {
        return titles[index];
    }

    function totalTitles() public view returns (uint256) {
        return titles.length;
    }
}
