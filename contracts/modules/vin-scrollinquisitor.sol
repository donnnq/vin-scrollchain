// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollBarracks {
    function getMission(uint256 id) external view returns (
        address agent,
        string memory operation,
        string memory target,
        string memory signature,
        bool approved,
        uint256 timestamp
    );
    function totalMissions() external view returns (uint256);
}

contract VinScrollInquisitor {
    IVinScrollBarracks public barracks;
    address public immutable highInquisitor;

    event SuspicionRaised(uint256 indexed missionId, address indexed agent, string reason);
    event RedeployBlocked(address indexed agent, string reason, uint256 timestamp);

    modifier onlyInquisitor() {
        require(msg.sender == highInquisitor, "Not the inquisitor");
        _;
    }

    constructor(address barracksAddress) {
        barracks = IVinScrollBarracks(barracksAddress);
        highInquisitor = msg.sender;
    }

    function auditMissions() external onlyInquisitor {
        uint256 total = barracks.totalMissions();
        for (uint256 i = 0; i < total; i++) {
            (
                address agent,
                string memory operation,
                string memory _target,
                string memory signature,
                bool approved,
                uint256 _timestamp
            ) = barracks.getMission(i);

            if (!approved && _isSuspicious(operation, signature)) {
                emit SuspicionRaised(i, agent, "Unapproved mission with forged or empty signature");
            }

            if (_isRedeployAttempt(operation)) {
                emit RedeployBlocked(agent, "Unauthorized redeployment attempt", block.timestamp);
            }
        }
    }

    function _isSuspicious(string memory operation, string memory signature) internal pure returns (bool) {
        return (bytes(signature).length == 0 || keccak256(bytes(signature)) == keccak256(bytes("0x0"))) &&
               (keccak256(bytes(operation)) != keccak256(bytes("heartbeat")));
    }

    function _isRedeployAttempt(string memory operation) internal pure returns (bool) {
        return keccak256(bytes(operation)) == keccak256(bytes("redeploy")) ||
               keccak256(bytes(operation)) == keccak256(bytes("reinit"));
    }
}
