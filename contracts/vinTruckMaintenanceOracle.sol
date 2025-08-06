// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinTruckMaintenanceOracle
/// @dev Tracks truck health, logs fuel scores, and awards performance bonuses

contract vinTruckMaintenanceOracle {
    address public oracleAdmin;
    uint256 public ecoBonusPool;

    struct TruckLog {
        string id;
        uint256 fuelEfficiency; // score out of 100
        uint256 maintenanceScore; // score out of 100
        uint256 ecoBonusClaimed;
        uint256 lastUpdated;
    }

    mapping(string => TruckLog) public logs;
    string[] public truckIds;

    event TruckLogged(string indexed id, uint256 bonus);
    event TruckRegistered(string indexed id);

    modifier onlyAdmin() {
        require(msg.sender == oracleAdmin, "Restricted");
        _;
    }

    constructor(uint256 initialPool) {
        oracleAdmin = msg.sender;
        ecoBonusPool = initialPool;
    }

    function registerTruck(string memory id) public onlyAdmin {
        logs[id] = TruckLog(id, 0, 0, 0, block.timestamp);
        truckIds.push(id);
        emit TruckRegistered(id);
    }

    function submitLog(string memory id, uint256 fuelEfficiency, uint256 maintenanceScore) public onlyAdmin {
        require(fuelEfficiency <= 100 && maintenanceScore <= 100, "Max 100 score");
        TruckLog storage log = logs[id];
        log.fuelEfficiency = fuelEfficiency;
        log.maintenanceScore = maintenanceScore;
        log.lastUpdated = block.timestamp;

        uint256 totalScore = fuelEfficiency + maintenanceScore;
        uint256 bonus = (ecoBonusPool * totalScore) / 20000;
        log.ecoBonusClaimed += bonus;
        ecoBonusPool -= bonus;

        emit TruckLogged(id, bonus);
    }

    function viewTruckLog(string memory id) public view returns (TruckLog memory) {
        return logs[id];
    }

    function refillBonusPool(uint256 amount) public onlyAdmin {
        ecoBonusPool += amount;
    }

    function listTruckIDs() public view returns (string[] memory) {
        return truckIds;
    }
}
