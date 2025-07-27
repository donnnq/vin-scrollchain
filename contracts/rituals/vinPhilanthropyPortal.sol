// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinPhilanthropyPortal
/// @notice Log and reward charitable actions on-chain.
contract vinPhilanthropyPortal is Ownable {
    uint256 public nextBadgeId;

    // donor => total donated
    mapping(address => uint256) public totalDonations;
    // volunteer event => hours logged
    mapping(bytes32 => mapping(address => uint256)) public volunteerHours;
    // user => minted badge IDs
    mapping(address => uint256[]) public badges;

    event DonationLogged(address indexed donor, address indexed recipient, uint256 amount);
    event VolunteerLogged(address indexed volunteer, bytes32 eventId, uint256 hours);
    event PhilBadgeMinted(address indexed user, uint256 badgeId);

    /// @notice Log a donation to an on-chain recipient.
    function logDonation(address recipient) external payable {
        require(msg.value > 0, "No value");
        totalDonations[msg.sender] += msg.value;
        payable(recipient).transfer(msg.value);
        emit DonationLogged(msg.sender, recipient, msg.value);
    }

    /// @notice Log volunteer hours for a given event.
    function logVolunteer(bytes32 eventId, uint256 hours) external {
        require(hours > 0, "Hours >0");
        volunteerHours[eventId][msg.sender] += hours;
        emit VolunteerLogged(msg.sender, eventId, hours);
    }

    /// @notice Mint a philanthropy badge to boost trustRate.
    function mintPhilanthropyBadge(address user) external onlyOwner {
        uint256 badgeId = nextBadgeId++;
        badges[user].push(badgeId);
        emit PhilBadgeMinted(user, badgeId);
    }
}
