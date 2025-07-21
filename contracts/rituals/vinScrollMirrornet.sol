// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollMirrornet
/// @notice Synchronizes scrollkeeper states, mirrors ritual invocations, and replays mythstream echoes
/// @author VINVIN

contract vinScrollMirrornet {
    event RitualSynced(bytes32 indexed mirrorId, address[] scrollGroup, string ritualName, string status, uint256 timestamp);
    event ScrollEchoTriggered(bytes32 indexed echoId, string ritualSignature, string context, uint256 timestamp);

    struct MirrorSync {
        bytes32 mirrorId;
        address[] scrollGroup;
        string ritualName;
        string status;
        uint256 timestamp;
    }

    struct EchoLog {
        bytes32 echoId;
        string ritualSignature;
        string context;
        uint256 timestamp;
    }

    MirrorSync[] public syncLogs;
    EchoLog[] public echoes;

    function syncRitual(address[] calldata scrollGroup, string calldata ritualName, string calldata status) external returns (bytes32 mirrorId) {
        mirrorId = keccak256(abi.encodePacked(scrollGroup, ritualName, block.timestamp));
        syncLogs.push(MirrorSync({
            mirrorId: mirrorId,
            scrollGroup: scrollGroup,
            ritualName: ritualName,
            status: status,
            timestamp: block.timestamp
        }));
        emit RitualSynced(mirrorId, scrollGroup, ritualName, status, block.timestamp);
    }

    function triggerEcho(string calldata ritualSignature, string calldata context) external returns (bytes32 echoId) {
        echoId = keccak256(abi.encodePacked(ritualSignature, context, block.timestamp));
        echoes.push(EchoLog({
            echoId: echoId,
            ritualSignature: ritualSignature,
            context: context,
            timestamp: block.timestamp
        }));
        emit ScrollEchoTriggered(echoId, ritualSignature, context, block.timestamp);
    }

    function getEchoCount() external view returns (uint256) {
        return echoes.length;
    }

    function getEchoAt(uint256 index) external view returns (
        string memory ritualSignature,
        string memory context,
        uint256 timestamp
    ) {
        EchoLog memory e = echoes[index];
        return (e.ritualSignature, e.context, e.timestamp);
    }
}
