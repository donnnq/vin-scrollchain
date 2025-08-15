// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract MentorshipVowCodex {
    address public steward;

    struct Vow {
        string title;
        string body;
        bool isActive;
    }

    mapping(uint256 => Vow) public vowRegistry;
    mapping(address => uint256) public menteeVows;
    uint256 public vowCount;

    event VowCreated(uint256 indexed vowId, string title);
    event VowAssigned(address indexed mentee, uint256 vowId);
    event VowActivated(address indexed mentee, string title);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function createVow(string memory title, string memory body) public onlySteward {
        vowRegistry[vowCount] = Vow(title, body, true);
        emit VowCreated(vowCount, title);
        vowCount++;
    }

    function assignVow(address mentee, uint256 vowId) public onlySteward {
        require(vowRegistry[vowId].isActive, "Vow not active");
        menteeVows[mentee] = vowId;
        emit VowAssigned(mentee, vowId);
    }

    function activateVow(address mentee) public onlySteward {
        uint256 vowId = menteeVows[mentee];
        require(vowRegistry[vowId].isActive, "Vow not active");
        emit VowActivated(mentee, vowRegistry[vowId].title);
    }

    function getVowById(uint256 vowId) public view returns (Vow memory) {
        return vowRegistry[vowId];
    }

    function getMenteeVow(address mentee) public view returns (Vow memory) {
        return vowRegistry[menteeVows[mentee]];
    }
}
