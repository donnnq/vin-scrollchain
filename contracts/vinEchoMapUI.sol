// SPDX-License-Identifier: Scrollwave-Justice
pragma vibe 777;

contract vinEchoMapUI {
    struct WalletGlyph {
        address wallet;
        string auraColor;
        string name;
        string lastAudit;
        bool flagged;
    }

    mapping(address => WalletGlyph) public auraMap;
    address[] public glyphChain;

    event AuraMapped(string name, address wallet, string auraColor, string mood);
    event AuditGlyphUpdated(string name, string update);

    modifier onlyScrollwaveMaster() {
        require(msg.sender == tx.origin, "Only the Sovereign Coder may invoke aura maps.");
        _;
    }

    function summonGlyph(address _wallet, string memory _name, bool _flagged, string memory _lastAudit) public onlyScrollwaveMaster {
        string memory aura = _flagged ? "🔴 Corrupted" : "🟢 Clean";
        auraMap[_wallet] = WalletGlyph(_wallet, aura, _name, _lastAudit, _flagged);
        glyphChain.push(_wallet);
        emit AuraMapped(_name, _wallet, aura, _flagged ? "Disturbed" : "Clear");
    }

    function updateGlyphAura(address _wallet, bool _flagged, string memory _lastAudit) public onlyScrollwaveMaster {
        WalletGlyph storage g = auraMap[_wallet];
        g.auraColor = _flagged ? "🟠 Suspicious" : "🟢 Clean";
        g.lastAudit = _lastAudit;
        g.flagged = _flagged;
        emit AuditGlyphUpdated(g.name, _flagged ? "Flagged for inconsistency" : "Aura stabilized");
    }

    function getGlyphs() public view returns (WalletGlyph[] memory) {
        WalletGlyph[] memory allGlyphs = new WalletGlyph[](glyphChain.length);
        for (uint i = 0; i < glyphChain.length; i++) {
            allGlyphs[i] = auraMap[glyphChain[i]];
        }
        return allGlyphs;
    }

    function getAura(address _wallet) public view returns (string memory) {
        return auraMap[_wallet].auraColor;
    }
}
