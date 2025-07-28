// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinNuclearCustodyVault {
    address public peaceCommander;
    uint256 public pactBlock;
    bool public custodyProtocolActive;

    struct SurrenderedCore {
        address originNation;
        string assetDesignation;
        uint256 timestamp;
        bool sealedPrivate;
    }

    SurrenderedCore[] public custodyLog;

    event CoreSurrendered(address originNation, string assetDesignation);
    event ProtocolActivated(string decree);

    modifier onlyCommander() {
        require(msg.sender == peaceCommander, "Only the commander may activate custody.");
        _;
    }

    constructor() {
        peaceCommander = msg.sender;
        pactBlock = block.number;
        custodyProtocolActive = false;
    }

    function activateCustodyProtocol(string memory decreeNote) external onlyCommander {
        custodyProtocolActive = true;
        emit ProtocolActivated(decreeNote);
    }

    function surrenderAsset(string memory assetDesignation) external {
        require(custodyProtocolActive, "Custody protocol not active.");
        custodyLog.push(SurrenderedCore(msg.sender, assetDesignation, block.timestamp, true));
        emit CoreSurrendered(msg.sender, assetDesignation);
    }

    function viewLastSurrenderedCore() external view returns (SurrenderedCore memory) {
        require(custodyLog.length > 0, "No assets surrendered yet.");
        return custodyLog[custodyLog.length - 1];
    }
}
