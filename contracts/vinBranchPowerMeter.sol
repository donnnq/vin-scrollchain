// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBranchPowerMeter {
    address public meterAdmin;

    enum Branch { Executive, Legislative, Judiciary }

    struct PowerSnapshot {
        uint256 timestamp;
        uint256 executivePower;
        uint256 legislativePower;
        uint256 judiciaryPower;
    }

    PowerSnapshot[] public snapshots;

    event SnapshotLogged(uint256 timestamp, uint256 exec, uint256 legis, uint256 jud);

    modifier onlyAdmin() {
        require(msg.sender == meterAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        meterAdmin = _admin;
    }

    function logSnapshot(uint256 exec, uint256 legis, uint256 jud) external onlyAdmin {
        snapshots.push(PowerSnapshot({
            timestamp: block.timestamp,
            executivePower: exec,
            legislativePower: legis,
            judiciaryPower: jud
        }));

        emit SnapshotLogged(block.timestamp, exec, legis, jud);
    }

    function getSnapshot(uint256 index) external view returns (PowerSnapshot memory) {
        require(index < snapshots.length, "Invalid index");
        return snapshots[index];
    }

    function getLatestSnapshot() external view returns (PowerSnapshot memory) {
        return snapshots[snapshots.length - 1];
    }
}
