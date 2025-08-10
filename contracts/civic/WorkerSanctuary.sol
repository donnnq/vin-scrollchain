// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title WorkerSanctuary - Grants housing to working immigrants in service of the U.S.
/// @author Vinvin
/// @notice Encodes eligibility, service verification, and housing allocation

contract WorkerSanctuary {
    address public scrollsmith;

    struct Unit {
        uint256 id;
        string location;
        bool isAllocated;
        string typeOfWork; // e.g. "Healthcare", "Construction", "Education"
    }

    struct Worker {
        address immigrant;
        string name;
        string workSector;
        bool isVerified;
        bool grantedUnit;
        uint256 unitId;
        uint256 timestamp;
    }

    uint256 public nextUnitId;
    mapping(uint256 => Unit) public units;
    mapping(address => Worker) public workers;
    address[] public honoredList;

    event UnitGranted(address indexed immigrant, uint256 unitId, string location, string workSector);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Add housing units for working immigrants
    function addUnit(string calldata location, string calldata typeOfWork) external onlyScrollsmith {
        units[nextUnitId] = Unit(nextUnitId, location, false, typeOfWork);
        nextUnitId++;
    }

    /// @notice Worker requests housing
    function requestUnit(string calldata name, string calldata workSector) external {
        require(!workers[msg.sender].grantedUnit, "Already granted");

        workers[msg.sender] = Worker(
            msg.sender,
            name,
            workSector,
            false,
            false,
            0,
            block.timestamp
        );
    }

    /// @notice Verify worker and grant housing based on sector
    function verifyAndGrant(address immigrant) external onlyScrollsmith {
        Worker storage w = workers[immigrant];
        require(!w.grantedUnit, "Already granted");

        for (uint256 i = 0; i < nextUnitId; i++) {
            if (!units[i].isAllocated && keccak256(bytes(units[i].typeOfWork)) == keccak256(bytes(w.workSector))) {
                units[i].isAllocated = true;
                w.unitId = i;
                w.isVerified = true;
                w.grantedUnit = true;
                honoredList.push(immigrant);
                emit UnitGranted(immigrant, i, units[i].location, w.workSector);
                return;
            }
        }

        revert("No matching units available");
    }

    /// @notice View honored workers
    function getHonoredList() external view returns (address[] memory) {
        return honoredList;
    }

    /// @notice View unit details
    function getUnit(uint256 unitId) external view returns (Unit memory) {
        return units[unitId];
    }

    /// @notice View worker details
    function getWorker(address immigrant) external view returns (Worker memory) {
        return workers[immigrant];
    }
}
