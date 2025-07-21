// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinThreatPurgeProtocol {
    event PatchApplied(address indexed server, string patchVersion, uint256 timestamp);
    event KeyRotated(address indexed server, string rotationMethod, uint256 timestamp);
    event IOCDetected(address indexed server, string iocType, string data, uint256 timestamp);
    event PurgeComplete(address indexed server, bool success, string notes, uint256 timestamp);

    struct ThreatPurgeCycle {
        string patchVersion;
        string rotationMethod;
        string[] iocTypes;
        bool purgeSuccess;
        string notes;
    }

    mapping(address => ThreatPurgeCycle[]) public purgeLog;

    function logPatch(address _server, string calldata _version) external {
        purgeLog[_server].push(ThreatPurgeCycle({
            patchVersion: _version,
            rotationMethod: "",
            iocTypes: new string[](0),
            purgeSuccess: false,
            notes: ""
        }));
        emit PatchApplied(_server, _version, block.timestamp);
    }

    function rotateKeys(address _server, string calldata _method) external {
        uint256 index = purgeLog[_server].length - 1;
        purgeLog[_server][index].rotationMethod = _method;
        emit KeyRotated(_server, _method, block.timestamp);
    }

    function detectIOC(address _server, string calldata _type, string calldata _data) external {
        uint256 index = purgeLog[_server].length - 1;
        purgeLog[_server][index].iocTypes.push(_type);
        emit IOCDetected(_server, _type, _data, block.timestamp);
    }

    function confirmPurge(address _server, bool _success, string calldata _notes) external {
        uint256 index = purgeLog[_server].length - 1;
        purgeLog[_server][index].purgeSuccess = _success;
        purgeLog[_server][index].notes = _notes;
        emit PurgeComplete(_server, _success, _notes, block.timestamp);
    }

    function viewLatestThreatPurge(address _server) external view returns (ThreatPurgeCycle memory) {
        uint256 index = purgeLog[_server].length;
        require(index > 0, "Scrollkeeper silence — no purge ritual performed.");
        return purgeLog[_server][index - 1];
    }
}
