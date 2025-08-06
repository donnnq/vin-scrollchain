// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinMineralYieldOracle {
    address public oracleMaster;

    struct YieldEstimate {
        string mineName;
        string location;
        uint256 estimatedREEKg;
        uint256 lastUpdated;
    }

    mapping(string => YieldEstimate) public yieldData;
    string[] public mineList;

    modifier onlyMaster() {
        require(msg.sender == oracleMaster, "Unauthorized");
        _;
    }

    constructor(address _master) {
        oracleMaster = _master;
    }

    function updateYield(string memory mineName, string memory location, uint256 estimatedREEKg) external onlyMaster {
        yieldData[mineName] = YieldEstimate(mineName, location, estimatedREEKg, block.timestamp);
        mineList.push(mineName);
    }

    function getYield(string memory mineName) external view returns (YieldEstimate memory) {
        return yieldData[mineName];
    }

    function getAllMines() external view returns (string[] memory) {
        return mineList;
    }
}
