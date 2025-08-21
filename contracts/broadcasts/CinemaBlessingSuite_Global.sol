// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.0;

/// @title CinemaBlessingSuite_Global
/// @author Vinvin
/// @notice Blesses creators across roles and franchises with ritual-grade support

contract CinemaBlessingSuite_Global {
    address public steward;
    uint256 public totalBlessings;

    enum Role { Actor, Director, Producer, Steward }

    struct Blessing {
        address creator;
        uint256 amount;
        string purpose;
        Role role;
        string[] franchises;
        string timestamp;
    }

    Blessing[] public blessings;

    mapping(address => Blessing[]) public creatorBlessings;
    mapping(address => Role) public creatorRoles;
    mapping(address => string[]) public creatorFranchises;

    event BlessingIssued(address creator, uint256 amount, string purpose, Role role, string[] franchises, string timestamp);

    constructor() {
        steward = msg.sender;
    }

    function blessCreator(
        address creator,
        uint256 amount,
        string memory purpose,
        Role role,
        string[] memory franchises,
        string memory timestamp
    ) public {
        require(msg.sender == steward, "Only steward may bless");
        Blessing memory newBlessing = Blessing(creator, amount, purpose, role, franchises, timestamp);
        blessings.push(newBlessing);
        creatorBlessings[creator].push(newBlessing);
        creatorRoles[creator] = role;
        creatorFranchises[creator] = franchises;
        totalBlessings += amount;

        emit BlessingIssued(creator, amount, purpose, role, franchises, timestamp);
    }

    function getBlessingsForCreator(address creator) public view returns (Blessing[] memory) {
        return creatorBlessings[creator];
    }

    function getAllBlessings() public view returns (Blessing[] memory) {
        return blessings;
    }

    function getCreatorFranchises(address creator) public view returns (string[] memory) {
        return creatorFranchises[creator];
    }

    function getCreatorRole(address creator) public view returns (Role) {
        return creatorRoles[creator];
    }
}
