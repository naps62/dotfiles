#!/bin/sh

# source "$(dirname "$0")/rpcs.sh"

# Set ETH_RPC_URL and ETHERSCAN_API_KEY (the defaults that forge + cast read) based on chain name
# Uses values sourced from rpcs.sh
chain() {
    chain_name=$1
    if [[ "$1" == "polygon" ]]
    then
        export ETH_RPC_URL=$POLYGON_RPC_URL
        export ETHERSCAN_API_KEY=$POLYGON_ETHERSCAN_API_KEY
    elif [[ "$1" == "mumbai" ]]
    then
        export ETH_RPC_URL=$MUMBAI_RPC_URL
        export ETHERSCAN_API_KEY=$POLYGON_ETHERSCAN_API_KEY
    
    elif [[ "$1" == "goerli" ]]
    then
        export ETH_RPC_URL=$GOERLI_RPC_URL
        export ETHERSCAN_API_KEY=$ETHEREUM_ETHERSCAN_API_KEY
    elif [[ "$1" == "anvil" ]]
    then
        export ETH_RPC_URL=$ANVIL_RPC_URL
    else
        # fallback is mainnet
        export chain_name="mainnet"
        export ETHERSCAN_API_KEY=$ETHEREUM_ETHERSCAN_API_KEY
        export ETH_RPC_URL=$ETHEREUM_RPC_URL
    fi
}

# optional - add current active chain name to your bash prompt

# if using powerlevel10k theme, add this function to your p10k.zsh
# and add `chain` to either your POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS or POWERLEVEL9K_LEFT_PROMPT_ELEMENTS
# function prompt_chain() {
# p10k segment -b 14 -i '🔗' -t "$chain_name"
# }

# if not using a fancy terminal theme - uncomment to prepend active chain to prompt, ie [mainnet]
# export PS1='[$chain_name]'$PS1


# Useful chain-agnostic (CREATE2'd) addresses
export SEADROP=0x00005ea00ac477b1030ce78506496e8c2de24bf5
export SEAPORT=0x00000000006c3852cbEf3e08E8dF289169EdE581
export FILTER=0x000000000000AAeB6D7670E522A718067333cd4E
export TRANSFER_HELPER=0x0000000000c2d145a2526bD8C716263bFeBe1A72
export ECRECOVER=0x0000000000000000000000000000000000000001
export REGISTRANT=0x3cc6CddA760b79bAfa08dF41ECFA224f810dCeB6
export IMMUTABLE_CREATE2=0x0000000000FFe8B47B3e2130213B802212439497

# Useful Ethereum Mainnet addresses
export SLIME=0x3ae7FA3Ea5635B3b727C042FECfA9b818B9d8ea3
export CONDUIT=0x1E0049783F008A0085193E00003D00cd54003c71
export PUNKS=0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB
export ROYALTY_ETH=0xad2184fb5dbcfc05d8f056542fb25b04fa32a95d
export ENGINE_ETH=0x0385603ab55642cb4dd5de3ae9e306809991804f
export PAUSABLE_ZONE=0x004C00500000aD104D7DBd00e3ae0A5C00560C00
export APECOIN=0x4d224452801ACEd8B2F0aebE155379bb5D594381
export BAYC=0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D
export MAYC=0x60E4d786628Fea6478F785A6d7e704777c86a7c6
export BAKC=0xba30E5F9Bb24caa003E9f2f0497Ad287FDF95623
export APE_STAKE=0x5954aB967Bc958940b7EB73ee84797Dc8a2AFbb9

# Useful Polygon Mainnet addresses
export ROYALTY_POLY=0xe7c9Cb6D966f76f3B5142167088927Bf34966a1f
export ENGINE_POLY=0x28EdFcF0Be7E86b07493466e7631a213bDe8eEF2

ecrecover() {
    cast call $ECRECOVER $(cast abi-encode "ecrecover(bytes32,uint8,bytes32,bytes32)(address)" $1 $2 $3 $4) 
}

# "Decimal to Hex"
d2h() {
    cast --to-base $1 16
}

# "Hex to Decimal"
h2d() {
    cast --to-base $1 10
}

# balanceOf(address)
balanceof() {
    cast call $1 "balanceOf(address)(uint256)" $2   
}

# ERC721::ownerOf(uint256)
ownerof() {
    cast call $1 "ownerOf(uint256)(address)" $2
}

# ERC1155::balanceOf(address, uint256)
balanceof11() {
    cast call $1 "balanceOf(address, uint256)(uint256)" $2 $3
}

# ERC721:tokenURI(uint256)
uri() {
    cast call $1 "tokenURI(uint256)(string)" $2
}

# ERC1155::uri(uint256)
uri11() {
    cast call $1 "uri(uint256)(string)" $2
}

# look up ens name (minus .eth suffix)
ens() {
    cast resolve-name $1.eth
}

# look up the admin slot of a proxy
admin() {
    cast --abi-decode "sig()(address)" $(cast storage $1 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103)
}

# look up the implementation slot of a proxy
impl() {
    cast --abi-decode "sig()(address)"  $(cast storage $1 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)
}

# look up the owner of an ownable contract
owner() {
    cast call $1 "owner()(address)"
}

# Foundry helpers

# The verbosity config value in foundry.toml normally takes preference over FOUNDRY_VERBOSITY, but defaults to 0
# The helper functions inline this variable to override the verbosity level set in foundry.toml
FOUNDRY_VERBOSITY=3

# "Forge contract" - Run forge tests that match a specific contract
fcon() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --match-contract $1
}

# "Forge contract watch" Run forge tests that match a specific contract and watch for changes
fconw() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --match-contract $1 --watch
}

# "Forge test <test>" - Run forge tests that match a specific test
ftest() {
    if [ $# -eq 1 ]; then
        FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --match-test $1
    elif [ $# -eq 0 ]; then
        FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test
    fi
    
}

# "Forge test <test> watch" - Run Forge tests that match a specific test and watch for changes
ftestw() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --match-test $1 --watch
    
}

# "Forge test" - Run all Forge tests for the current active Foundry profile
ft() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test
}

# "Forge snapshot" - Run a gas snapshot and sort results by ascending gas usage
fs() {
    forge snapshot --asc
}

# "Forge gas" - Run all tests and generate a gas report
fg() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --gas-report
}

# "Forge watch" - Run all tests and watch for changes
fw() {
    FOUNDRY_VERBOSITY=$FOUNDRY_VERBOSITY forge test --watch
}

# "Forge build" - Build the project with the current active Foundry profile
fb() {
    forge build
}

# "Forge coverage" - Generate a coverage summary report as well as an lcov.info, and generate an HTML report from the lcov.info
# Requires the lcov package to be installed
fcov() {
    forge coverage --report summary --report lcov && genhtml lcov.info -o html --branch
}

# "Seaport coverage" - Generate a coverage report for the Seaport repo
spcov() {
    SEAPORT_COVERAGE=true forge coverage --report summary --report lcov && genhtml lcov.info -o html --branch
}

# "Forge debug" - Debug a specific test
fdebug() {
    SEAPORT_COVERAGE=true forge test --debug $1
}

# "Checksum address" - Generate a checksum address from a hex address and copy it to the clipboard
caddr() {
    new_addr=$(cast --to-checksum-address $1)
    echo $new_addr
    echo $new_addr | pbcopy
}


# for easily testing forge scripts
# eg: in script: `address deployer = vm.addr(vm.envUint('anvilPk'))`, or
#     `address deployer = vm.envAddress("anvilAddr")` + in bash command: `--private-key $anvilPk`, etc
export anvilAddr=0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
export anvilPk=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# "good morning" - update Foundry and Huff
alias gm="foundryup;"
# Use forge remappings to generate a remappings file
alias remap="forge remappings > remappings.txt"

chain
