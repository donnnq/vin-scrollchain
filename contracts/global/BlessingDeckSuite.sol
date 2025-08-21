// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

import "./vinAPRHeatmapDeck.sol";
import "./BlessingDeckAutoBroadcastBot.sol";
import "./vinGlobalBlessingLedger.sol";
import "./BlessingDeckQRScroll.sol";

contract BlessingDeckSuite {
    vinAPRHeatmapDeck public heatmap;
    BlessingDeckAutoBroadcastBot public autobot;
    vinGlobalBlessingLedger public ledger;
    BlessingDeckQRScroll public qrScroll;

    constructor(
        address _heatmap,
        address _autobot,
        address _ledger,
        address _qrScroll
    ) {
        heatmap = vinAPRHeatmapDeck(_heatmap);
        autobot = BlessingDeckAutoBroadcastBot(_autobot);
        ledger = vinGlobalBlessingLedger(_ledger);
        qrScroll = BlessingDeckQRScroll(_qrScroll);
    }

    function triggerBlessingSuite(
        vinAPRHeatmapDeck.Region _region,
        string memory _country,
        string memory _partnerOrg,
        uint256 _aprScore,
        string memory _blessingType,
        string memory _qrLink
    ) public {
        heatmap.logAPRSurge(_region, _country, _aprScore);

        if (_aprScore >= 90) {
            string memory broadcastMsg = string(abi.encodePacked(
                "Blessing activated for ", _partnerOrg, " in ", _country,
                ". APR: ", uint2str(_aprScore), ". Type: ", _blessingType
            ));

            autobot.autoBroadcast(_country, _partnerOrg, _aprScore, _blessingType);
            ledger.logBlessing(_country, _partnerOrg, _aprScore, _blessingType, broadcastMsg);
            qrScroll.generateQRBlessing(_partnerOrg, _blessingType, broadcastMsg, _qrLink);
        }
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        return string(bstr);
    }
}
