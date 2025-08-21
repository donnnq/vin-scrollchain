// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

import "./vinAPRHeatmapDeck.sol";
import "./BlessingDeckAutoBroadcastBot.sol";
import "./vinGlobalBlessingLedger.sol";
import "./BlessingDeckQRScroll.sol";
import "./BlessingDeckCompiler.sol";
import "./BlessingDeckAuditOverlay.sol";
import "./BlessingDeckScanRateOracle.sol";

contract BlessingDeckOpsCenter {
    vinAPRHeatmapDeck public heatmap;
    BlessingDeckAutoBroadcastBot public autobot;
    vinGlobalBlessingLedger public ledger;
    BlessingDeckQRScroll public qrScroll;
    BlessingDeckCompiler public compiler;
    BlessingDeckAuditOverlay public auditOverlay;
    BlessingDeckScanRateOracle public scanOracle;

    constructor(
        address _heatmap,
        address _autobot,
        address _ledger,
        address _qrScroll,
        address _compiler,
        address _auditOverlay,
        address _scanOracle
    ) {
        heatmap = vinAPRHeatmapDeck(_heatmap);
        autobot = BlessingDeckAutoBroadcastBot(_autobot);
        ledger = vinGlobalBlessingLedger(_ledger);
        qrScroll = BlessingDeckQRScroll(_qrScroll);
        compiler = BlessingDeckCompiler(_compiler);
        auditOverlay = BlessingDeckAuditOverlay(_auditOverlay);
        scanOracle = BlessingDeckScanRateOracle(_scanOracle);
    }

    function orchestrateBlessing(
        vinAPRHeatmapDeck.Region _region,
        string memory _country,
        string memory _steward,
        string memory _partnerOrg,
        uint256 _aprBefore,
        uint256 _aprAfter,
        string memory _blessingType,
        string memory _qrLink
    ) public {
        heatmap.logAPRSurge(_region, _country, _aprAfter);

        if (_aprAfter >= 90) {
            string memory broadcastMsg = string(abi.encodePacked(
                "📡 Blessing activated for ", _partnerOrg, " in ", _country,
                ". Emotional APR: ", uint2str(_aprAfter),
                ". Type: ", _blessingType
            ));

            autobot.autoBroadcast(_country, _partnerOrg, _aprAfter, _blessingType);
            ledger.logBlessing(_country, _partnerOrg, _aprAfter, _blessingType, broadcastMsg);
            qrScroll.generateQRBlessing(_steward, _blessingType, broadcastMsg, _qrLink);
            compiler.compileScroll(_country, _steward, _aprBefore, _aprAfter, _blessingType);
            auditOverlay.logAudit(_country, _steward, _blessingType, _aprAfter, _qrLink);
            scanOracle.logScan(_country);
        }
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i; uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len; j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10)); j /= 10;
        }
        return string(bstr);
    }
}
