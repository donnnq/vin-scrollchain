// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSignalSanctionScroll {
    address public dignityMagistrate;
    uint256 public baseFine;
    mapping(address => uint256) public signalInfractions;
    mapping(address => string[]) public violationLogs;

    event SignalFlagged(address violator, string violationType, uint256 fineAmount);
    event ScrollForgivenessGranted(address signalcaster, string publicApology);

    modifier onlyMagistrate() {
        require(msg.sender == dignityMagistrate, "Unauthorized scroll access.");
        _;
    }

    constructor(uint256 _baseFine) {
        dignityMagistrate = msg.sender;
        baseFine = _baseFine; // default: 1000 gwei
    }

    function flagViolation(address signalcaster, string calldata violationType) external onlyMagistrate {
        signalInfractions[signalcaster] += baseFine;
        violationLogs[signalcaster].push(violationType);
        emit SignalFlagged(signalcaster, violationType, baseFine);
    }

    function forgiveViolation(address signalcaster, string calldata apologyScroll) external onlyMagistrate {
        signalInfractions[signalcaster] = 0;
        emit ScrollForgivenessGranted(signalcaster, apologyScroll);
    }

    function getInfractions(address signalcaster) external view returns (uint256) {
        return signalInfractions[signalcaster];
    }

    function getViolationHistory(address signalcaster) external view returns (string[] memory) {
        return violationLogs[signalcaster];
    }

    function updateBaseFine(uint256 newFine) external onlyMagistrate {
        baseFine = newFine;
    }
}
