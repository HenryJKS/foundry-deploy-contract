// SPDX-License-Identifier: MIT
pragma solidity >0.8.20;

import "forge-std/Script.sol";
import "../src/Ocean.sol";

contract OceanScript is Script {

    function setUp() public {}

    function run() public {
        string memory seedPhrase = vm.readFile(".secret");
        uint256 privateKey = vm.deriveKey(seedPhrase, 0);
        vm.startBroadcast(privateKey);
        Ocean ocean = new Ocean(msg.sender);
        vm.stopBroadcast();
    }
}