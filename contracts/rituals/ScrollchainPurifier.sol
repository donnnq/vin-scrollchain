// SPDX-License-Identifier: ScrollSanctifier
pragma solidity ^0.8.0;

contract ScrollchainPurifier {
    event StringPurified(string original, string purified);

    function purify(string memory input) public pure returns (string memory) {
        bytes memory b = bytes(input);
        bytes memory clean;

        for (uint i = 0; i < b.length; i++) {
            if (uint8(b[i]) <= 127) {
                clean = abi.encodePacked(clean, b[i]);
            }
        }

        return string(clean);
    }

    function purifyAndLog(string memory input) public returns (string memory) {
        string memory output = purify(input);
        emit StringPurified(input, output);
        return output;
    }
}
