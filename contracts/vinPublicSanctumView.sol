// SPDX-License-Identifier: Scrollwave-PublicView
pragma transparency 777;

interface AuditEchoBoard {
    function getTrackedWallets() external view returns (address[] memory);
    function getNextEcho(address _wallet) external view returns (uint256);
}

interface EchoMapUI {
    function getAura(address _wallet) external view returns (string memory);
}

contract vinPublicSanctumView {
    AuditEchoBoard public echoBoard;
    EchoMapUI public mapUI;

    constructor(address _echoBoard, address _mapUI) {
        echoBoard = AuditEchoBoard(_echoBoard);
        mapUI = EchoMapUI(_mapUI);
    }

    function viewSanctum() public view returns (string[] memory auraGlyphs) {
        address[] memory wallets = echoBoard.getTrackedWallets();
        auraGlyphs = new string[](wallets.length);
        for (uint i = 0; i < wallets.length; i++) {
            auraGlyphs[i] = mapUI.getAura(wallets[i]);
        }
    }
}
