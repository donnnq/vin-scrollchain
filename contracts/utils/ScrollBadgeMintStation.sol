// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollBadgeMintStation - Badge contract for scrollchain achievements
/// @author VINVIN
/// @notice Mints and tracks deployment badges for completed missions
contract ScrollBadgeMintStation {
    address public scrollAdmin;
    uint256 public badgeCount;

    struct Badge {
        string label;
        uint256 timestamp;
        address deployer;
    }

    mapping(uint256 => Badge) public badgeLog;
    mapping(address => uint256[]) public deployerBadges;

    event BadgeMinted(address indexed deployer, uint256 indexed badgeId, string label);

    modifier onlyAdmin() {
        require(msg.sender == scrollAdmin, "Not authorized");
        _;
    }

    constructor() {
        scrollAdmin = msg.sender;
    }

    /// @notice Mint a badge for the calling deployer with a descriptive label
    function mintBadge(string memory _label) external {
        badgeLog[badgeCount] = Badge(_label, block.timestamp, msg.sender);
        deployerBadges[msg.sender].push(badgeCount);
        emit BadgeMinted(msg.sender, badgeCount, _label);
        badgeCount++;
    }

    /// @notice Retrieve all badge IDs minted to a given deployer
    function getBadgeIds(address _user) external view returns (uint256[] memory) {
        return deployerBadges[_user];
    }

    /// @notice Fetch details for a specific badge
    function getBadgeDetails(uint256 _badgeId)
        external
        view
        returns (string memory label, uint256 timestamp, address deployer)
    {
        Badge memory b = badgeLog[_badgeId];
        return (b.label, b.timestamp, b.deployer);
    }

    /// @notice Allow admin to transfer adminship if needed
    function updateScrollAdmin(address _newAdmin) external onlyAdmin {
        scrollAdmin = _newAdmin;
    }
}
