// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinBlessingEchoDeck {
    struct EchoLog {
        string originNation;
        string receivingNation;
        string steward;
        string broadcastSigil;
        string echoEffect; // e.g. “Policy Reform”, “Sanctuary Activation”, “APR Surge”
        uint256 empathyRipple;
        uint256 trustRipple;
        uint256 mythicClarityRipple;
        uint256 timestamp;
    }

    EchoLog[] public echoes;

    event EchoTracked(string originNation, string receivingNation, string broadcastSigil, string echoEffect);

    function trackEcho(
        string memory originNation,
        string memory receivingNation,
        string memory steward,
        string memory broadcastSigil,
        string memory echoEffect,
        uint256 empathyRipple,
        uint256 trustRipple,
        uint256 mythicClarityRipple
    ) public {
        echoes.push(EchoLog(
            originNation,
            receivingNation,
            steward,
            broadcastSigil,
            echoEffect,
            empathyRipple,
            trustRipple,
            mythicClarityRipple,
            block.timestamp
        ));

        emit EchoTracked(originNation, receivingNation, broadcastSigil, echoEffect);
    }

    function getEchoes() public view returns (EchoLog[] memory) {
        return echoes;
    }
}
