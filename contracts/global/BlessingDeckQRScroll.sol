// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckQRScroll {
    struct QRBlessing {
        string stewardName;
        string blessingType;
        string encodedMessage;
        string qrLink;
        uint256 timestamp;
    }

    QRBlessing[] public qrBlessings;

    event QRBlessingGenerated(string stewardName, string blessingType, string qrLink);

    function generateQRBlessing(
        string memory _stewardName,
        string memory _blessingType,
        string memory _encodedMessage,
        string memory _qrLink
    ) public {
        qrBlessings.push(QRBlessing({
            stewardName: _stewardName,
            blessingType: _blessingType,
            encodedMessage: _encodedMessage,
            qrLink: _qrLink,
            timestamp: block.timestamp
        }));

        emit QRBlessingGenerated(_stewardName, _blessingType, _qrLink);
    }

    function getQRBlessings() public view returns (QRBlessing[] memory) {
        return qrBlessings;
    }
}
