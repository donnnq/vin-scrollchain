// SPDX-License-Identifier: CARE
pragma solidity ^0.8.17;

contract vinSanctuaryShield {
    address public scrollLord;

    struct SanctuarySoul {
        string name;
        string location;
        uint256 animalCount;
        uint256 donationBalance;
        bool active;
    }

    mapping(uint256 => SanctuarySoul) public sanctuaries;
    uint256 public sanctuaryCount;

    event SanctuaryRegistered(uint256 indexed id, string name, string location);
    event DonationReceived(uint256 indexed id, uint256 amount);
    event AnimalUpdate(uint256 indexed id, uint256 newCount);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Unauthorized scroll wielder.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function registerSanctuary(string memory name, string memory location) public onlyScrollLord {
        sanctuaries[sanctuaryCount] = SanctuarySoul(name, location, 0, 0, true);
        emit SanctuaryRegistered(sanctuaryCount, name, location);
        sanctuaryCount++;
    }

    function logDonation(uint256 id, uint256 amount) public onlyScrollLord {
        sanctuaries[id].donationBalance += amount;
        emit DonationReceived(id, amount);
    }

    function updateAnimalCount(uint256 id, uint256 newCount) public onlyScrollLord {
        sanctuaries[id].animalCount = newCount;
        emit AnimalUpdate(id, newCount);
    }
}
