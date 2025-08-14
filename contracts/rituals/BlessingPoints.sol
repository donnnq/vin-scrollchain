// SPDX-License-Identifier: Mythic-Karma
pragma solidity ^0.8.20;

contract BlessingPoints {
    address public steward;
    mapping(address => uint256) public points;

    event BlessingAwarded(address indexed helper, uint256 amount, string reason);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can award blessings");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Award blessing points to a helper
    function awardBlessing(address helper, uint256 amount, string memory reason) external onlySteward {
        points[helper] += amount;
        emit BlessingAwarded(helper, amount, reason);
    }

    /// @notice View blessing points of a worker
    function getPoints(address worker) external view returns (uint256) {
        return points[worker];
    }
}
