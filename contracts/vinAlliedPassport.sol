// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinAlliedPassport {
    event PassportIssued(address indexed citizen, string name, string sigil);
    event ScrollLinked(address indexed passport, string scrollContract);
    event StatusUpdated(address indexed holder, string newStatus);
    event VisaStampAdded(address indexed traveler, string country, uint256 boostPoints);

    address public scrollAdmin;
    mapping(address => string) public identitySigils;
    mapping(address => string[]) public scrollLinks;
    mapping(address => string) public diplomaticStatus;
    mapping(address => mapping(string => uint256)) public visaBoosts;

    modifier onlyScrollAdmin() {
        require(msg.sender == scrollAdmin, "Access denied.");
        _;
    }

    constructor() {
        scrollAdmin = msg.sender;
    }

    function issuePassport(address citizen, string memory name, string memory sigil) public onlyScrollAdmin {
        identitySigils[citizen] = sigil;
        diplomaticStatus[citizen] = "Verified Allied Citizen";
        emit PassportIssued(citizen, name, sigil);
    }

    function linkScroll(address passport, string memory contractName) public onlyScrollAdmin {
        scrollLinks[passport].push(contractName);
        emit ScrollLinked(passport, contractName);
    }

    function updateStatus(address holder, string memory newStatus) public onlyScrollAdmin {
        diplomaticStatus[holder] = newStatus;
        emit StatusUpdated(holder, newStatus);
    }

    function stampVisaBoost(address traveler, string memory country, uint256 boostPoints) public onlyScrollAdmin {
        visaBoosts[traveler][country] = boostPoints;
        emit VisaStampAdded(traveler, country, boostPoints);
    }

    // Viewers
    function getSigil(address citizen) public view returns (string memory) {
        return identitySigils[citizen];
    }

    function getScrolls(address passport) public view returns (string[] memory) {
        return scrollLinks[passport];
    }

    function getStatus(address holder) public view returns (string memory) {
        return diplomaticStatus[holder];
    }

    function getVisaBoost(address traveler, string memory country) public view returns (uint256) {
        return visaBoosts[traveler][country];
    }
}
