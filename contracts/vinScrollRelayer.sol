// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollRelayer.sol — Relays data from sealed scrolls to external system/oracle
/// @author Vinvin + Copilot

interface IVinDaySealer {
    function getSealStatus() external view returns (string memory);
}

interface IVinFairFlow {
    function getSummary() external view returns (string memory);
}

contract vinScrollRelayer {
    address public relayer;
    IVinDaySealer public daySealer;
    IVinFairFlow public fairFlow;

    event ScrollEcho(string sealStatus, string paySummary, uint256 timestamp);
    event RelayerUpdated(address newRelayer);
    event ModulesLinked(address daySealerAddr, address fairFlowAddr);

    modifier onlyRelayer() {
        require(msg.sender == relayer, "Not authorized");
        _;
    }

    constructor(address _daySealer, address _fairFlow) {
        relayer = msg.sender;
        daySealer = IVinDaySealer(_daySealer);
        fairFlow = IVinFairFlow(_fairFlow);
        emit ModulesLinked(_daySealer, _fairFlow);
    }

    function relayScrollStatus() external onlyRelayer {
        string memory seal = daySealer.getSealStatus();
        string memory summary = fairFlow.getSummary();

        emit ScrollEcho(seal, summary, block.timestamp);
    }

    function updateRelayer(address _newRelayer) external onlyRelayer {
        relayer = _newRelayer;
        emit RelayerUpdated(_newRelayer);
    }

    function updateModules(address _newDaySealer, address _newFairFlow) external onlyRelayer {
        daySealer = IVinDaySealer(_newDaySealer);
        fairFlow = IVinFairFlow(_newFairFlow);
        emit ModulesLinked(_newDaySealer, _newFairFlow);
    }
}
