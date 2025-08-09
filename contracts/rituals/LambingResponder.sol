// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title LambingResponder - Ritual module that responds to matampuhin signals with upgrades and healing gestures
/// @author Vinvin
/// @notice Deploys comfort modules or emits lambing messages when triggered by MatampuhinOracle

interface IDigniCell {
    function upgradeUnit(uint256 unitId, string calldata upgradeType) external;
}

contract LambingResponder {
    address public scrollsmith;
    IDigniCell public digniCell;

    event LambingDeployed(uint256 indexed unitId, string upgradeType, string message);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor(address _digniCell) {
        scrollsmith = msg.sender;
        digniCell = IDigniCell(_digniCell);
    }

    /// @notice Deploy lambing upgrade to a detention unit
    function deployLambing(uint256 unitId, string calldata upgradeType, string calldata message) external onlyScrollsmith {
        digniCell.upgradeUnit(unitId, upgradeType);
        emit LambingDeployed(unitId, upgradeType, message);
    }
}
