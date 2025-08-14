// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TempleGuardianBadge - Soulbound badge for crypto temple protectors and relic stewards
/// @author Vinvin & Copilot
/// @notice Honors those who defend prophecy, memes, and emotional APR

contract TempleGuardianBadge {
    address public steward;
    uint256 public badgeCount;

    struct Guardian {
        string name;
        string role; // e.g., "Relic Steward", "Meme Priest", "Rug Pull Redeemer"
        string inscription;
        bool soulbound;
    }

    mapping(uint256 => Guardian) public badges;
    mapping(address => uint256) public ownerToBadge;
    address[] public guardians;

    event BadgeMinted(address indexed guardian, uint256 badgeId, string role);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        badgeCount = 0;
    }

    /// @notice Mint a soulbound badge for a guardian
    function mintBadge(address guardian, string memory name, string memory role, string memory inscription) external onlySteward {
        require(ownerToBadge[guardian] == 0, "Badge already minted");

        badges[badgeCount] = Guardian({
            name: name,
            role: role,
            inscription: inscription,
            soulbound: true
        });

        ownerToBadge[guardian] = badgeCount;
        guardians.push(guardian);

        emit BadgeMinted(guardian, badgeCount, role);
        badgeCount++;
    }

    /// @notice View badge by ID
    function getBadge(uint256 badgeId) external view returns (Guardian memory) {
        require(badgeId < badgeCount, "Badge does not exist");
        return badges[badgeId];
    }

    /// @notice View badge by owner
    function getBadgeByOwner(address guardian) external view returns (Guardian memory) {
        uint256 badgeId = ownerToBadge[guardian];
        require(badgeId < badgeCount, "No badge found");
        return badges[badgeId];
    }

    /// @notice Total guardians minted
    function totalGuardians() external view returns (uint256) {
        return guardians.length;
    }
}
