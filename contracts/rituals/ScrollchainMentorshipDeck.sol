// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ScrollchainMentorshipDeck {
    address public steward;

    struct MenteeProfile {
        string name;
        string skillFocus;
        string aiToolAssigned;
        bool hasTakenVow;
        bool sahodEligible;
    }

    mapping(address => MenteeProfile) public mentees;
    address[] public menteeList;

    event MenteeOnboarded(address indexed mentee, string name, string skillFocus, string aiToolAssigned);
    event CivicVowTaken(address indexed mentee);
    event SahodBlessed(address indexed mentee, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function onboardMentee(
        address mentee,
        string memory name,
        string memory skillFocus,
        string memory aiToolAssigned
    ) public onlySteward {
        mentees[mentee] = MenteeProfile(name, skillFocus, aiToolAssigned, false, false);
        menteeList.push(mentee);
        emit MenteeOnboarded(mentee, name, skillFocus, aiToolAssigned);
    }

    function takeCivicVow(address mentee) public onlySteward {
        require(bytes(mentees[mentee].name).length > 0, "Mentee not onboarded");
        mentees[mentee].hasTakenVow = true;
        mentees[mentee].sahodEligible = true;
        emit CivicVowTaken(mentee);
    }

    function blessSahod(address mentee) public onlySteward {
        require(mentees[mentee].sahodEligible, "Not eligible for sahod");
        emit SahodBlessed(mentee, 0.5 ether); // Ritualized sahod amount
    }

    function getMenteeList() public view returns (address[] memory) {
        return menteeList;
    }

    function getMenteeProfile(address mentee) public view returns (MenteeProfile memory) {
        return mentees[mentee];
    }
}
